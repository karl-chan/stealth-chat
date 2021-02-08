import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/login/stealth/dictionary_page.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/auth.dart';

class LoginController extends GetxController {
  loginAndRedirect(
      String password, BootConfig boot, Future<void> onLoginFailed()) async {
    bool success = Auth.login(password);
    if (success) {
      logDebug('Login controller:' + (boot.destination == null).toString());
      boot.destination != null
          ? await boot.destination()
          : await Get.off(HomePage());
    } else {
      await onLoginFailed();
    }
  }
}

class LoginPage extends StatelessWidget {
  final BootConfig boot;

  LoginPage(BootConfig boot, {Key key})
      : this.boot = boot,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DictionaryPage(boot);
  }
}
