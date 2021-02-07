import 'package:moor/moor.dart';
import 'package:stealth_chat/util/db/db.dart';

part 'notifications.g.dart';

class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get body => text()();
  BoolColumn get unread => boolean()();
}

@UseDao(tables: [Notifications], include: {'notifications.moor'})
class NotificationsDao extends DatabaseAccessor<AppDb>
    with _$NotificationsDaoMixin {
  NotificationsDao(AppDb db) : super(db);

  Future<void> insert({String title, String subtitle, String body}) async {
    NotificationsCompanion.insert(
        title: title, subtitle: subtitle, body: body, unread: true);
  }

  Stream<List<Notification>> listNotifications() {
    return (select(notifications)).watch();
  }

  Stream<int> countUnreadNotifications() {
    return (select(notifications)..where((n) => n.unread))
        .watch()
        .map((ns) => ns.length);
  }
}
