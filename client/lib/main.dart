import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/contact/accept_invite_page.dart';
import 'package:stealth_chat/globals.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  runApp(Phoenix(child: MainApp()));
}

class MainApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  StreamSubscription _sub;
  Function bootCallback;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    registerAppLinkHandlers();
  }

  @override
  void dispose() {
    if (_sub != null) {
      _sub.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        if (Get.isRegistered<Globals>()) {
          Globals globals = Get.find();
          if (globals.isLoggedIn) {
            await globals.logout();
          }
          await Get.delete<Globals>();
        }
        return;
      case AppLifecycleState.resumed:
        await Get.offAll(BootScreen());
        return;
      default:
    }
  }

  Future<void> registerAppLinkHandlers() async {
    // on cold boot
    Uri appLink = await getInitialUri();
    await handleAppLinkOnColdBoot(appLink);

    // on warm pause
    _sub = getUriLinksStream().listen((link) async {
      await handleAppLinkOnWarmPause(link);
    });
  }

  Future<void> handleAppLinkOnColdBoot(Uri appLink) async {
    if (appLink != null) {
      if (appLink.path.startsWith(Paths.ACCEPT_INVITE)) {
        bootCallback = () async {
          await Get.to(AcceptInvitePage(appLink));
        };
      }
    }
  }

  Future<void> handleAppLinkOnWarmPause(Uri appLink) async {
    await handleAppLinkOnColdBoot(appLink);
    await Get.offAll(BootScreen(callback: bootCallback));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with 'flutter run'. You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // 'hot reload' (press 'r' in the console where you ran 'flutter run',
        // or simply save your changes to 'hot reload' in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BootScreen(callback: bootCallback),
    );
  }
}
