import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/api/user_api.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class AcceptInviteController extends GetxController {
  final String id;
  final String timestamp;
  final String signature;

  final RxBool isSignatureValid = RxBool(null);
  final RxString name;

  AcceptInviteController(Uri applink)
      : this.id = applink.queryParameters['id'],
        this.name = applink.queryParameters['name'].obs,
        this.timestamp = applink.queryParameters['ts'],
        this.signature = applink.queryParameters['sig'] {
    validateSignature();
  }

  validateSignature() async {
    final signatureTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    if (DateTime.now().isBefore(signatureTime)) {
      isSignatureValid.value = false;
      return;
    }

    final user = await UserApi.show(id);
    if (!Rsa.verify('$id|$name|$timestamp', signature,
        Keys(publicKey: RSAPublicKey.fromPEM(user.publicKey)))) {
      isSignatureValid.value = false;
      return;
    }

    isSignatureValid.value = true;
  }
}

class AcceptInvitePage extends StatelessWidget {
  final Uri appLink;

  const AcceptInvitePage(Uri appLink, {Key key})
      : this.appLink = appLink,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AcceptInviteController c = Get.put(AcceptInviteController(appLink));
    return Scaffold(
        appBar: AppBar(
          title: Text('Accept invite'),
        ),
        body: Obx(() => Container(
                child: Card(
              child: Column(
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
              ),
            ))));
  }
}
