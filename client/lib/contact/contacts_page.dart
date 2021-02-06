import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/db/db.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/settings/settings_page.dart';

enum Menu { addContact, settings }

class ContactsController extends GetxController {
  final RxList<Contact> contacts;

  ContactsController(Globals globals)
      : this.contacts = List<Contact>().obs
          ..bindStream(globals.db.contacts.listContacts());
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
        IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () => Get.to(AddContactPage()),
        ),
        IconButton(
          icon: Icon(Icons.mail),
          onPressed: () => Get.to(AddContactPage()),
        ),
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
            'You have no contacts.',
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
              Text(' to start.')
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
