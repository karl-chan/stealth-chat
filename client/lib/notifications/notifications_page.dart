import 'package:flutter/material.dart' hide Notification;
import 'package:get/get.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';

class NotificationsController extends GetxController {
  final RxList<Notification> notifications;

  NotificationsController(Globals globals)
      : this.notifications = List<Notification>().obs
          ..bindStream(globals.db.notifications.listNotifications());
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    NotificationsController c = Get.put(NotificationsController(globals));

    final emptyView = DefaultTextStyle(
        style: TextStyle(color: Colors.grey, fontSize: 24),
        child: Center(
            child: Text(
          'You have no notifications',
        )));

    final notificationsList = Obx(() => ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: c.notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = c.notifications.elementAt(index);

            return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.subtitle),
                onTap: () => Get.defaultDialog(
                      title: notification.title,
                      content: Text(notification.body),
                    ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));

    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body:
            Obx(() => c.notifications.isEmpty ? emptyView : notificationsList));
  }
}
