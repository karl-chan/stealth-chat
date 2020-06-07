import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:stealth_chat/login/LoginPage.dart';
import 'package:stealth_chat/register/registration_page.dart';

import '../globals.dart';

enum BootStatus {
  BOOTING,
  REDIRECT_TO_REGISTRATION_PAGE,
  REDIRECT_TO_LOGIN_PAGE
}

class BootController extends GetxController {
  var status = BootStatus.BOOTING;

  boot() async {
    Globals globals = await Globals().init();
    Get.put(globals);

    if (globals.user.id == null) {
      status = BootStatus.REDIRECT_TO_REGISTRATION_PAGE;
      Get.off(RegistrationPage());
    } else {
      status = BootStatus.REDIRECT_TO_LOGIN_PAGE;
      Get.off(LoginPage());
    }
  }
}

class BootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BootController c = Get.put(BootController());
    c.boot();
    return Scaffold(
        body: Center(
            child: Container(
                child: (Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
          Text(
            'Loading',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 30),
          GradientProgressIndicator()
        ])))));
  }
}
