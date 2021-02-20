import 'dart:core';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/chat/chat_page.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/contact/avatar.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/notifications/notifications_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';

enum Menu { addContact, settings }

class ContactsController extends GetxController {
  final RxList<Contact> contacts;
  final RxMap<String, ChatMessage> mostRecentMessages;
  final RxMap<String, int> numUnreadMessages;
  final RxInt numUnreadNotifications;

  ContactsController(Globals globals)
      : this.contacts = <Contact>[].obs
          ..bindStream(globals.db.contacts.listContacts()),
        this.mostRecentMessages = Map<String, ChatMessage>().obs
          ..bindStream(globals.db.chatMessages
              .listMostRecentMessages()
              .map((messages) => {for (final m in messages) m.contactId: m})),
        this.numUnreadMessages = Map<String, int>().obs
          ..bindStream(globals.db.chatMessages.countUnreadMessages()),
        this.numUnreadNotifications = 0.obs
          ..bindStream(globals.db.notifications.countUnreadNotifications());
}

class ContactsPage extends StatelessWidget {
  ContactsPage({Key key}) : super(key: key);

  Widget renderLastMessage(ChatMessage mostRecentMessage, int numUnread) {
    if (mostRecentMessage == null) {
      return Text('');
    }
    if (numUnread == null) {
      return Text(
        mostRecentMessage.message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        '${mostRecentMessage.message} ($numUnread)',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

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
    ContactsController c = ContactsController(globals);

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
          padding: const EdgeInsets.all(8),
          itemCount: c.contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = c.contacts.elementAt(index);

            return ListTile(
                leading: Avatar(contact),
                title: Text(contact.name),
                subtitle: Obx(
                  () => renderLastMessage(c.mostRecentMessages[contact.id],
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
                onTap: () => Get.to(ChatPage(contact)));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));

    return Scaffold(
      appBar: appBar,
      body: Obx(() => c.contacts.isEmpty ? emptyView : contactsList),
    );
  }
}
