import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stealth_chat/globals.dart';

class Firebase {
  final Globals globals;
  final FirebaseMessaging fcm = FirebaseMessaging.instance;

  Firebase(Globals globals) : this.globals = globals;

  Future<AuthorizationStatus> getCurrentAuthorizationStatus() async {
    final settings = await fcm.getNotificationSettings();
    return settings.authorizationStatus;
  }

  Future<AuthorizationStatus> requestPermissions() async {
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus;
  }

  Future<String> getToken() async {
    return fcm.getToken(vapidKey: globals.properties.get('server.vapid_key'));
  }
}
