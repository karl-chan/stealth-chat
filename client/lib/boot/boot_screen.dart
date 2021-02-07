import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/login/LoginPage.dart';
import 'package:stealth_chat/register/registration_page.dart';
import 'package:stealth_chat/util/logging.dart';

typedef BootDestination = Future<dynamic> Function();

enum BootStatus {
  BOOTING,
  REDIRECT_TO_REGISTRATION_PAGE,
  REDIRECT_TO_LOGIN_PAGE
}

class BootController extends GetxController {
  Rx<BootStatus> status = BootStatus.BOOTING.obs;

  boot() async {
    Globals globals;
    if (Get.isRegistered<Globals>()) {
      logInfo('Globals is already registered');
      globals = Get.find();
    } else {
      logInfo('Initialising globals...');
      globals = await Globals().init();
      Get.put(globals);
    }

    if (globals.user.id == null) {
      status.value = BootStatus.REDIRECT_TO_REGISTRATION_PAGE;
    } else {
      status.value = BootStatus.REDIRECT_TO_LOGIN_PAGE;
    }
  }
}

class BootScreen extends StatelessWidget {
  final BootDestination destination;

  BootScreen({Key key, BootDestination destination})
      : this.destination = destination ?? (() => Get.off(HomePage())),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final BootController c = Get.put(BootController());
    c.boot();

    return Obx(() {
      switch (c.status.value) {
        case BootStatus.REDIRECT_TO_REGISTRATION_PAGE:
          Future.microtask(
              () => Get.off(RegistrationPage(destination: destination)));
          break;

        case BootStatus.REDIRECT_TO_LOGIN_PAGE:
          Future.microtask(() => Get.off(LoginPage(destination: destination)));
          break;

        default:
      }
      return Scaffold(
          body: Center(
              child: Container(
                  child: (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            Text(
              'Loading',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            GradientProgressIndicator()
          ])))));
    });
  }
}
