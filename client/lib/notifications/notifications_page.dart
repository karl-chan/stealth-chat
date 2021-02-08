import 'package:flutter/material.dart' hide Notification;
import 'package:get/get.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/time.dart';

class NotificationsController extends GetxController {
  final RxList<Notification> notifications;
  final RxBool isMultiSelectMode;
  final RxSet<Notification> selected;

  final Globals globals;

  NotificationsController(Globals globals)
      : this.notifications = List<Notification>().obs
          ..bindStream(globals.db.notifications
              .listNotifications()
              .map((notifications) => notifications.reversed.toList())),
        this.isMultiSelectMode = false.obs,
        this.selected = Set<Notification>().obs,
        this.globals = globals;

  void enterMultiSelectMode(Notification notification) {
    this.selected.add(notification);
    this.isMultiSelectMode.value = true;
  }

  void exitMultiSelectMode() {
    this.selected.clear();
    this.isMultiSelectMode.value = false;
  }

  bool isSelected(Notification notification) {
    return this.selected.contains(notification);
  }

  void toggleSelect(Notification notification) {
    if (isSelected(notification)) {
      this.selected.remove(notification);
    } else {
      this.selected.add(notification);
    }
  }

  void openNotification(Notification notification) async {
    await Get.defaultDialog(
        title: notification.title,
        middleText: notification.body,
        textConfirm: 'Dismiss',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back());
    if (notification.unread) {
      await globals.db.notifications.markAsRead(notification);
    }
  }

  void deleteNotifications() async {
    await Get.defaultDialog(
        title: 'Confirm delete',
        middleText: 'Are you sure to delete the selected notifications?',
        confirm: TextButton(
            onPressed: () async {
              await globals.db.notifications.remove(this.selected.toList());
              Get.back();
            },
            child: Text('Yes', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(backgroundColor: Colors.green)),
        cancel: TextButton(
          onPressed: Get.back,
          child: Text('No', style: TextStyle(color: Colors.white)),
          style: TextButton.styleFrom(backgroundColor: Colors.red),
        ));
  }
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
          itemCount: c.notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = c.notifications.elementAt(index);

            return Obx(() => Ink(
                color: c.isSelected(notification) ? Colors.pink.shade100 : null,
                child: ListTile(
                  title: Text(notification.title,
                      style: TextStyle(
                          fontWeight: notification.unread
                              ? FontWeight.bold
                              : FontWeight.normal)),
                  subtitle: Text(notification.subtitle),
                  trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(Time.shortHumanFormat(notification.timestamp)),
                        Text('')
                      ]),
                  onTap: () => c.isMultiSelectMode.value
                      ? c.toggleSelect(notification)
                      : c.openNotification(notification),
                  onLongPress: () => c.enterMultiSelectMode(notification),
                )));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 0),
        ));

    final appBar = AppBar(title: Text('Notifications'));
    final multiSelectModeAppBar = AppBar(
      title: Obx(() => Text('${c.selected.length} selected')),
      backgroundColor: Colors.pink,
      centerTitle: false,
      actions: [
        Tooltip(
          message: 'Delete selected',
          child: IconButton(
              icon: Icon(Icons.delete), onPressed: c.deleteNotifications),
        )
      ],
    );

    return Obx(() => WillPopScope(
        onWillPop: () async {
          if (c.isMultiSelectMode.value) {
            c.exitMultiSelectMode();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
            appBar: c.isMultiSelectMode.value ? multiSelectModeAppBar : appBar,
            body: c.notifications.isEmpty ? emptyView : notificationsList)));
  }
}
