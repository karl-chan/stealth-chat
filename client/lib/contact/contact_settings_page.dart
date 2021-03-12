import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stealth_chat/contact/avatar.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/main.dart';
import 'package:stealth_chat/util/compress.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/logging.dart';

class ContactSettingsController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  final Globals globals;
  final Rx<Contact> contact;
  final Rx<Color> themeColour;

  ContactSettingsController(Contact contact, Globals globals)
      : this.globals = globals,
        this.contact = contact.obs
          ..bindStream(globals.db.contacts.watchContact(contact.id)),
        // ignore: unnecessary_cast
        this.themeColour = (Colors.green as Color).obs {
    ever(this.contact, (c) => this.themeColour.value = Color(c.color));
  }

  Future<void> showChangeColourDialog() async {
    await Get.defaultDialog(
      title: 'Pick a colour',
      content: BlockPicker(
        pickerColor: themeColour.value,
        onColorChanged: (newColour) async {
          await globals.db.contacts.changeColour(contact.value.id, newColour);
        },
      ),
      textConfirm: 'Done',
      confirmTextColor: Colors.white,
      onConfirm: Get.back,
    );
  }

  Future<void> showChangeWallpaperDialog() async {
    final oldWallpaper = contact.value.wallpaper;
    bool changed = false;
    stayAwake(true);

    await Get.defaultDialog(
        title: 'Set wallpaper',
        barrierDismissible: false,
        content: Center(
          child: OutlinedButton(
            onPressed: () async {
              final file =
                  await imagePicker.getImage(source: ImageSource.gallery);
              if (file != null) {
                changed = true;
                Uint8List wallpaper = await Compress.image(file.path);
                logDebug(
                    'Compressed wallpaper size: ${wallpaper.lengthInBytes / 1024} kB');
                await globals.db.contacts
                    .setWallpaper(contact.value.id, wallpaper);
              }
            },
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blueGrey),
                primary: Colors.blueGrey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_to_photos),
                const SizedBox(width: 10),
                const Text('Choose from gallery'),
              ],
            ),
          ),
        ),
        textConfirm: 'Confirm',
        confirmTextColor: Colors.white,
        onConfirm: () async {
          await Get.back();
          stayAwake(false);
        },
        cancelTextColor: Colors.red,
        textCancel: 'Cancel',
        onCancel: () async {
          if (changed) {
            await globals.db.contacts
                .setWallpaper(contact.value.id, oldWallpaper);
          }
          stayAwake(false);
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
              floating: true,
              backgroundColor: c.themeColour.value,
              flexibleSpace: Container(
                  decoration: c.contact.value.wallpaper != null
                      ? BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(c.contact.value.wallpaper)))
                      : null,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Avatar(c.contact.value, darkMode: true, size: 50),
                        SizedBox(height: 10),
                        Text(
                          c.contact.value.name,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ])),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                ListTile(
                  leading: Icon(Icons.color_lens, color: c.themeColour.value),
                  title: Text('Change colour'),
                  onTap: c.showChangeColourDialog,
                ),
                ListTile(
                  leading: Icon(Icons.wallpaper),
                  title: Text('Change wallpaper'),
                  onTap: c.showChangeWallpaperDialog,
                ),
              ]),
            ),
          ],
        )));
  }
}
