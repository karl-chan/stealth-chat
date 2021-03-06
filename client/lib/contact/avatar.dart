import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';

class AvatarController extends GetxController {
  final Rx<Contact> contact;

  AvatarController(Contact contact, Globals globals)
      : this.contact = contact.obs
          ..bindStream(globals.db.contacts.watchContact(contact.id));
}

class Avatar extends StatelessWidget {
  final Contact contact;
  final bool darkMode;
  final double size;

  const Avatar(Contact contact, {Key key, bool darkMode = false, double size})
      : this.contact = contact,
        this.darkMode = darkMode,
        this.size = size,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    AvatarController c =
        Get.put(AvatarController(contact, globals), tag: contact.id);

    return Container(
      child: Obx(() {
        Widget avatar = CircleAvatar(
          radius: size,
          child: Text(
            c.contact.value.name.characters.elementAt(0).toUpperCase(),
            style: TextStyle(
                fontSize: size,
                color: darkMode ? Color(c.contact.value.color) : Colors.white),
          ),
          backgroundColor:
              darkMode ? Colors.white : Color(c.contact.value.color),
        );

        if (c.contact.value.online) {
          avatar = Badge(
              badgeColor: Colors.green,
              position: BadgePosition.bottomEnd(end: 0, bottom: 0),
              borderSide: BorderSide(color: Colors.white, width: 1),
              child: avatar);
        }

        return avatar;
      }),
    );
  }
}
