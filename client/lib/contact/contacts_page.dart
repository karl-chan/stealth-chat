import 'dart:core';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/notifications/notifications_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/db/db.dart';

enum Menu { addContact, settings }

class ContactsController extends GetxController {
  final RxList<Contact> contacts;
  final RxInt numUnreadNotifications;

  ContactsController(Globals globals)
      : this.contacts = List<Contact>().obs
          ..bindStream(globals.db.contacts.listContacts()),
        this.numUnreadNotifications = 0.obs
          ..bindStream(globals.db.notifications.countUnreadNotifications());
}

class ContactsPage extends StatelessWidget {
  ContactsPage({Key key}) : super(key: key);

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
            final name = c.contacts.elementAt(index).name;
            return ListTile(
                leading: CircleAvatar(
                    child: Text(name.characters.elementAt(0).toUpperCase())),
                title: Text(name),
                subtitle: Text('Last message'),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text('Last seen'), Text('12:00 AM')]));
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
