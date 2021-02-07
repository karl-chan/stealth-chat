import 'package:moor/moor.dart';
import 'package:stealth_chat/db/db.dart';

part 'notifications.g.dart';

class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get body => text()();
}

@UseDao(tables: [Notifications])
class NotificationsDao extends DatabaseAccessor<AppDb>
    with _$NotificationsDaoMixin {
  NotificationsDao(AppDb db) : super(db);

  Future<void> insert({String title, String subtitle, String body}) async {
    NotificationsCompanion.insert(title: title, subtitle: subtitle, body: body);
  }

  Stream<List<Notification>> listNotifications() {
    return (select(notifications)).watch();
  }
}
