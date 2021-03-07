import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/globals.dart';

// Change connection settings
class ChangeConnectionSettingsController extends GetxController {
  final Globals globals;
  final TextEditingController changeServerHostController =
      TextEditingController();
  final RxString changeServerHostError = ''.obs;

  ChangeConnectionSettingsController(Globals globals) : this.globals = globals {
    changeServerHostController.addListener(validateServerHostInput);
  }

  @override
  void onClose() {
    changeServerHostController.dispose();
    super.onClose();
  }

  bool validateServerHostInput() {
    bool success = !changeServerHostController.text.isBlank;
    changeServerHostError.value = success ? null : 'Must not be blank!';
    return success;
  }

  Future<void> showConnectionSettings() async {
    await Get.defaultDialog(
        title: 'Change connection settings',
        content: Obx(() => TextField(
              controller: changeServerHostController,
              decoration: InputDecoration(
                labelText: 'Server host',
                helperText: 'e.g. xyz.com',
                errorText: changeServerHostError.value,
              ),
            )),
        confirm: Obx(
          () => MaterialButton(
              child: Text('Confirm'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: changeServerHostError.value == null
                  ? () async {
                      if (!validateServerHostInput()) {
                        return;
                      }
                      String newHost = changeServerHostController.text.trim();
                      changeServerHostController.clear();
                      await globals.prefs
                          .setString(Prefs.SERVER_HOST_OVERRIDE, newHost);
                      globals.serverHost = newHost;
                      Get.back();
                      Get.snackbar(
                          'Done', 'Successfully changed connection settings!',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  : null),
        ),
        cancel: MaterialButton(
          child: Text('Reset'),
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () async {
            await globals.prefs.remove(Prefs.SERVER_HOST_OVERRIDE);
            globals.serverHost =
                globals.properties.get(Prefs.SERVER_HOST_OVERRIDE);
            Get.back();
            Get.snackbar('Done', 'Succesfully reset connection settings!',
                snackPosition: SnackPosition.BOTTOM);
          },
        ));
  }
}

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    ChangeConnectionSettingsController c =
        Get.put(ChangeConnectionSettingsController(globals));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: [
          ListTile(
            title: const Text('Change connection settings'),
            onTap: () => c.showConnectionSettings(),
          ),
          ListTile(
            title: const Text('About'),
            trailing: Text('v${globals.packageInfo.buildNumber}'),
          ),
        ]));
  }
}
