import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/login/LoginPage.dart';
import 'package:stealth_chat/register/registration_page.dart';
import 'package:stealth_chat/util/logging.dart';

enum BootStatus {
  BOOTING,
  REDIRECT_TO_REGISTRATION_PAGE,
  REDIRECT_TO_LOGIN_PAGE
}

class BootConfig {
  Future<dynamic> Function() destination;
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
  final BootConfig boot;

  BootScreen(BootConfig boot, {Key key})
      : this.boot = boot,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    logDebug('Boot screen:' + (boot.destination == null).toString());
    final BootController c = Get.put(BootController());
    c.boot();

    return Obx(() {
      switch (c.status.value) {
        case BootStatus.REDIRECT_TO_REGISTRATION_PAGE:
          Future.microtask(() => Get.off(RegistrationPage(boot)));
          break;

        case BootStatus.REDIRECT_TO_LOGIN_PAGE:
          Future.microtask(() => Get.off(LoginPage(boot)));
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
