import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/util/api/user_api.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/security/rsa.dart';
import 'package:stealth_chat/util/socket/client/accept_invite_event.dart';

class AcceptInviteController extends GetxController {
  final Globals globals;

  final String id;
  final int timestamp;
  final String signature;
  RSAPublicKey publicKey;

  final RxString name;
  final RxString errorText = RxString(null);

  AcceptInviteController(Uri applink, Globals globals)
      : this.globals = globals,
        this.id = applink.queryParameters['id'],
        this.name = applink.queryParameters['name'].obs,
        this.timestamp = int.parse(applink.queryParameters['ts']),
        this.signature = applink.queryParameters['sig'] {
    validateId();
    validateSignature();
  }

  bool hasExpired(int timestamp) {
    final signatureTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime.now().difference(signatureTime).inDays > 1;
  }

  Future<void> validateSignature() async {
    if (hasExpired(timestamp)) {
      errorText.value =
          'The invite link has expired. Please request a new link from your contact.';
      return;
    }

    ShowUserResponse user;
    try {
      user = await UserApi.show(id);
      publicKey = RSAPublicKey.fromPEM(user.publicKey);
    } catch (err) {
      errorText.value = 'Failed to obtain contact\'s information. $err';
      logError(err);
      return;
    }

    if (!Rsa.verify(
        '$id|$name|$timestamp', signature, Keys(publicKey: publicKey))) {
      errorText.value =
          'The invite link is malformed. Please request a new link from your contact.';
      return;
    }
  }

  Future<void> validateId() async {
    if (id == globals.user.id) {
      errorText.value =
          'The invite link should be opened by your contact, not yourself.';
      return;
    }
    final isExistingContact = await globals.db.contacts.exist(id);
    if (isExistingContact) {
      errorText.value = 'You have already added $name';
      return;
    }
  }

  void accept() async {
    // generate chat secret key
    String chatSecretKey = Keys.randomSecretKey();
    String encryptedChatSecretKey =
        Rsa.encrypt(chatSecretKey, Keys(publicKey: publicKey));

    await Future.wait([
      // notify server
      globals.socket.client.acceptInvite.push(AcceptInviteMessage(
          theirId: id,
          myName: globals.user.name,
          encryptedChatSecretKey: encryptedChatSecretKey,
          timestamp: DateTime.now().millisecondsSinceEpoch)),

      // add to contacts
      globals.db.contacts.addContact(id, name.value, chatSecretKey,
          DateTime.fromMillisecondsSinceEpoch(timestamp))
    ]);

    finish();
    Get.snackbar('Done!', 'Added $name to my contacts.',
        snackPosition: SnackPosition.BOTTOM);
  }

  void decline() {
    finish();
  }

  void finish() {
    Get.off(HomePage());
  }
}

class AcceptInvitePage extends StatelessWidget {
  final Uri appLink;

  const AcceptInvitePage(Uri appLink, {Key key})
      : this.appLink = appLink,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    AcceptInviteController c =
        Get.put(AcceptInviteController(appLink, globals));

    final errorScreen = Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.error, color: Colors.red, size: 150),
          SizedBox(height: 50),
          Text(
            c.errorText.value,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );

    final acceptInviteScreen = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        Column(children: [
          Text('Do you wish to add', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Obx(() => Text(c.name.value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
          SizedBox(height: 10),
          Text('to your contacts?', style: TextStyle(fontSize: 18))
        ]),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text('Accept'),
              onPressed: c.accept,
              style: OutlinedButton.styleFrom(
                  primary: Colors.green, side: BorderSide(color: Colors.green)),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              child: const Text('Decline'),
              onPressed: c.decline,
              style: OutlinedButton.styleFrom(
                  primary: Colors.red, side: BorderSide(color: Colors.red)),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Accept invite'),
        ),
        body: Obx(() => Container(
              child:
                  c.errorText.value == null ? acceptInviteScreen : errorScreen,
            )));
  }
}
