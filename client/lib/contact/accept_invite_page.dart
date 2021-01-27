import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/api/user_api.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class AcceptInviteController extends GetxController {
  final Globals globals;

  final String id;
  final String timestamp;
  final String signature;

  final RxString name;
  final RxString errorText = RxString(null);

  AcceptInviteController(Uri applink, Globals globals)
      : this.globals = globals,
        this.id = applink.queryParameters['id'],
        this.name = applink.queryParameters['name'].obs,
        this.timestamp = applink.queryParameters['ts'],
        this.signature = applink.queryParameters['sig'] {
    validateId();
    validateSignature();
  }

  bool hasExpired(String timestamp) {
    final signatureTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    return DateTime.now().difference(signatureTime).inDays > 1;
  }

  Future<void> validateSignature() async {
    if (hasExpired(timestamp)) {
      errorText.value =
          'The invite link has expired. Please request a new link from your contact.';
      return;
    }

    var user;
    try {
      user = await UserApi.show(id);
    } catch (err) {
      errorText.value = 'Failed to obtain contact\'s information. $err';
      return;
    }

    if (!Rsa.verify('$id|$name|$timestamp', signature,
        Keys(publicKey: RSAPublicKey.fromPEM(user.publicKey)))) {
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

    final errorScreen = Obx(() => Container(
          child: Column(
            children: [
              Icon(Icons.error, color: Colors.red, size: 50),
              Text(c.errorText.value)
            ],
          ),
        ));

    final acceptInviteScreen = Obx(() => Column(
          children: [
            Text(c.name.value),
            Row(
              children: [
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Accept invite'),
        ),
        body: Container(
            child: Obx(() => Card(
                  child: c.errorText.value == null
                      ? acceptInviteScreen
                      : errorScreen,
                ))));
  }
}
