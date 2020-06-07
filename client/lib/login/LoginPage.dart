import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/stealth/dictionary_page.dart';
import 'package:stealth_chat/util/security/auth.dart';

class LoginController extends GetxController {
  static loginAndRedirect(String password, Future<void> onLoginFailed()) async {
    bool success = Auth.login(password);
    if (success) {
      Get.off(HomePage());
    } else {
      await onLoginFailed();
    }
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return DictionaryPage();
  }
}
