import 'dart:core';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/chat/chat_page.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/contact/avatar.dart';
import 'package:stealth_chat/contact/most_recent_message_preview.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/notifications/notifications_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/socket/client/delete_contacts_event.dart';

enum Menu { addContact, settings }

class ContactsController extends GetxController {
  final Globals globals;
  final RxList<Contact> contacts;
  final RxMap<String, ChatMessage> mostRecentMessages;
  final RxMap<String, int> numUnreadMessages;
  final RxInt numUnreadNotifications;

  final RxBool isMultiSelectMode;
  final RxSet<Contact> selected;

  ContactsController(Globals globals)
      : this.globals = globals,
        this.contacts = <Contact>[].obs
          ..bindStream(globals.db.contacts.listContacts()),
        this.mostRecentMessages = Map<String, ChatMessage>().obs
          ..bindStream(globals.db.chatMessages
              .listMostRecentMessages()
              .map((messages) => {for (final m in messages) m.contactId: m})),
        this.numUnreadMessages = Map<String, int>().obs
          ..bindStream(globals.db.chatMessages.countUnreadMessages()),
        this.numUnreadNotifications = 0.obs
          ..bindStream(globals.db.notifications.countUnreadNotifications()),
        this.isMultiSelectMode = false.obs,
        this.selected = Set<Contact>().obs;

  void enterMultiSelectMode(Contact contact) {
    this.selected.add(contact);
    this.isMultiSelectMode.value = true;
  }

  void exitMultiSelectMode() {
    this.selected.clear();
    this.isMultiSelectMode.value = false;
  }

  bool isSelected(Contact contact) {
    return this.selected.contains(contact);
  }

  void toggleSelect(Contact contact) {
    if (isSelected(contact)) {
      this.selected.remove(contact);
    } else {
      this.selected.add(contact);
    }
  }

  void deleteContacts() async {
    await Get.defaultDialog(
        title: 'Confirm delete',
        middleText: 'Are you sure to delete the selected contacts?',
        confirm: TextButton(
            onPressed: () async {
              final contactIds = this.selected.map(((c) => c.id)).toList();
              await globals.db.contacts.deleteContacts(contactIds);
              await globals.socket.client.deleteContacts
                  .push(DeleteContactsMessage(contactIds: contactIds));
              Get.back();
            },
            child: Text('Yes', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(backgroundColor: Colors.green)),
        cancel: TextButton(
          onPressed: Get.back,
          child: Text('No', style: TextStyle(color: Colors.white)),
          style: TextButton.styleFrom(backgroundColor: Colors.red),
        ));
  }
}

class ContactsPage extends StatelessWidget {
  ContactsPage({Key key}) : super(key: key);

  Widget renderMostRecentTimestamp(ChatMessage mostRecentMessage) {
    return Text(
        mostRecentMessage != null
            ? DateTimeFormatter.formatShort(mostRecentMessage.timestamp)
            : '',
        style: TextStyle(color: Colors.grey));
  }

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    ContactsController c = Get.put(ContactsController(globals));

    final appBar = AppBar(
      title: const Text('Contacts'),
      actions: [
        Tooltip(
            message: 'Add contact',
            child: IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () => Get.to(AddContactPage()),
            )),
        Tooltip(
            message: 'View notifications',
            child: IconButton(
              icon: Obx(() => Badge(
                  badgeContent: Text(
                    c.numUnreadNotifications.value.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  showBadge: c.numUnreadNotifications > 0,
                  child: Icon(Icons.notifications))),
              onPressed: () => Get.to(NotificationsPage()),
            )),
        PopupMenuButton<Function>(
          onSelected: (Function function) => function(),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<Function>(
                  value: () => Get.to(SettingsPage()),
                  child: const Text('Settings'))
            ];
          },
        ),
      ],
    );
    final multiSelectModeAppBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 36),
          onPressed: c.exitMultiSelectMode),
      title: Obx(() => Text('${c.selected.length} selected')),
      backgroundColor: Colors.green.shade900,
      centerTitle: false,
      actions: [
        Tooltip(
          message: 'Delete selected',
          child:
              IconButton(icon: Icon(Icons.delete), onPressed: c.deleteContacts),
        )
      ],
    );

    final emptyView = DefaultTextStyle(
        style: TextStyle(color: Colors.grey, fontSize: 24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You have no contacts',
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Press '),
              Icon(
                Icons.person_add,
                color: Colors.green,
              ),
              Text(' to add')
            ],
          )
        ]));

    final contactsList = Obx(() => ListView.separated(
          itemCount: c.contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = c.contacts.elementAt(index);

            return Obx(() => Ink(
                color: c.isSelected(contact) ? Colors.blue.shade100 : null,
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Avatar(contact),
                    title: Text(contact.name),
                    subtitle: Obx(
                      () => MostRecentMessagePreview(
                          c.mostRecentMessages[contact.id],
                          c.numUnreadMessages[contact.id]),
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(contact.online
                              ? 'Online'
                              : 'Last seen ${DateTimeFormatter.formatShort(contact.lastSeen)}'),
                          SizedBox(height: 5),
                          Obx(() => renderMostRecentTimestamp(
                              c.mostRecentMessages[contact.id]))
                        ]),
                    onTap: () => c.isMultiSelectMode.value
                        ? c.toggleSelect(contact)
                        : Get.to(ChatPage(contact)),
                    onLongPress: () => c.enterMultiSelectMode(contact))));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 0),
        ));

    return Obx(() => Scaffold(
        appBar: c.isMultiSelectMode.value ? multiSelectModeAppBar : appBar,
        body: Obx(() => c.contacts.isEmpty ? emptyView : contactsList)));
  }
}
