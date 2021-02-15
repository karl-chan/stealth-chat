import 'dart:core';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/chat/chat_page.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/notifications/notifications_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';

enum Menu { addContact, settings }

class ContactsController extends GetxController {
  final RxList<Contact> contacts;
  final RxMap<String, ChatMessage> mostRecentMessages;
  final RxInt numUnreadNotifications;

  ContactsController(Globals globals)
      : this.contacts = List<Contact>().obs
          ..bindStream(globals.db.contacts.listContacts()),
        this.mostRecentMessages = Map<String, ChatMessage>().obs
          ..bindStream(globals.db.chatMessages
              .listMostRecentMessages()
              .map((messages) => {for (final m in messages) m.contactId: m})),
        this.numUnreadNotifications = 0.obs
          ..bindStream(globals.db.notifications.countUnreadNotifications());
}

class ContactsPage extends StatelessWidget {
  ContactsPage({Key key}) : super(key: key);

  Widget getAvatar(Contact contact) {
    Widget avatar = CircleAvatar(
      child: Text(
        contact.name.characters.elementAt(0).toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(contact.color),
    );
    if (contact.online) {
      avatar = Badge(
          badgeColor: Colors.green,
          position: BadgePosition.bottomEnd(end: 0, bottom: 0),
          borderSide: BorderSide(color: Colors.white, width: 1),
          child: avatar);
    }
    return avatar;
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
                leading: getAvatar(contact),
                title: Text(contact.name),
                subtitle: Obx(() => Text(
                      c.mostRecentMessages[contact.id]?.message ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(contact.online
                          ? 'Online'
                          : 'Last seen ${DateTimeFormatter.formatShort(contact.lastSeen)}'),
                      SizedBox(height: 5),
                      Obx(() => Text(
                            c.mostRecentMessages[contact.id] != null
                                ? DateTimeFormatter.formatShort(
                                    c.mostRecentMessages[contact.id].timestamp)
                                : '',
                            style: TextStyle(color: Colors.grey),
                          ))
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
