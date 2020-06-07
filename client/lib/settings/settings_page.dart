import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: [
          ListTile(
            title: const Text('About'),
            trailing: Text('v${globals.packageInfo.buildNumber}'),
          )
        ]));
  }
}
