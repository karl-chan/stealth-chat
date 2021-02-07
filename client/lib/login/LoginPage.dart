import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/login/stealth/dictionary_page.dart';
import 'package:stealth_chat/util/security/auth.dart';

class LoginController extends GetxController {
  final Function callback;

  LoginController(Function callback) : this.callback = callback;

  loginAndRedirect(String password, Future<void> onLoginFailed()) async {
    bool success = Auth.login(password);
    if (success) {
      await Get.off(HomePage());
      if (callback != null) {
        callback();
      }
    } else {
      await onLoginFailed();
    }
  }
}

class LoginPage extends StatelessWidget {
  final Function callback;

  LoginPage({Key key, Function callback})
      : this.callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DictionaryPage(callback: callback);
  }
}
