import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';

class ContactSettingsController extends GetxController {
  final Globals globals;
  final Rx<Contact> contact;

  ContactSettingsController(Contact contact, Globals globals)
      : this.globals = globals,
        this.contact = contact.obs
          ..bindStream(globals.db.contacts.watchContact(contact.id));

  Future<void> showChangeColourDialog() async {
    Color pickedColour = Color(contact.value.color);
    await Get.defaultDialog(
        title: 'Pick a colour',
        content: BlockPicker(
          pickerColor: pickedColour,
          onColorChanged: (newColour) async {
            pickedColour = newColour;
          },
        ),
        textConfirm: 'Done',
        confirmTextColor: Colors.white,
        onConfirm: () async {
          await globals.db.contacts
              .changeColour(contact.value.id, pickedColour);
          Get.back();
        });
  }
}

class ContactSettingsPage extends StatelessWidget {
  final Contact contact;
  const ContactSettingsPage(Contact contact, {Key key})
      : this.contact = contact,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    ContactSettingsController c =
        Get.put(ContactSettingsController(contact, globals));
    return Obx(() => Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(c.contact.value.name),
              floating: true,
              flexibleSpace: Placeholder(),
              backgroundColor: Color(c.contact.value.color),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                ListTile(
                  leading: Icon(Icons.color_lens,
                      color: Color(c.contact.value.color)),
                  title: Text('Change colour'),
                  onTap: c.showChangeColourDialog,
                ),
              ]),
            ),
          ],
        )));
  }
}
