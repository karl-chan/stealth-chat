import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/contact/add_contact_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({Key key}) : super(key: key);

  void _navigate(Menu item) {
    switch (item) {
      case Menu.addContact:
        Get.to(AddContactPage());
        return;
      case Menu.settings:
        Get.to(SettingsPage());
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () => _navigate(Menu.addContact),
          ),
          PopupMenuButton<Menu>(
            onSelected: (Menu item) => _navigate(item),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<Menu>(
                    value: Menu.settings, child: const Text('Settings'))
              ];
            },
          ),
        ],
      ),
      body: Center(),
    );
  }
}

enum Menu { addContact, settings }
