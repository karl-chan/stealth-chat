import 'package:moor/moor.dart';
import 'package:stealth_chat/util/db/db.dart';

part 'notifications.g.dart';

class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get body => text()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get unread => boolean()();
}

@UseDao(tables: [Notifications], include: {'notifications.moor'})
class NotificationsDao extends DatabaseAccessor<AppDb>
    with _$NotificationsDaoMixin {
  NotificationsDao(AppDb db) : super(db);

  Future<void> insert(
      String title, String subtitle, String body, int timestamp) async {
    return into(notifications).insert(NotificationsCompanion.insert(
        title: title,
        subtitle: subtitle,
        body: body,
        timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp),
        unread: true));
  }

  Stream<List<Notification>> listNotifications() {
    return (select(notifications)).watch();
  }

  Stream<int> countUnreadNotifications() {
    return (select(notifications)..where((n) => n.unread))
        .watch()
        .map((ns) => ns.length);
  }

  Future<void> markAsRead(Notification notification) async {
    return (update(notifications)..where((n) => n.id.equals(notification.id)))
        .write(NotificationsCompanion(unread: Value(false)));
  }
}
