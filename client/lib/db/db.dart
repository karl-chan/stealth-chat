import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:stealth_chat/db/contacts.dart';
import 'package:stealth_chat/db/notifications.dart';
import 'package:stealth_chat/globals.dart';

part 'db.g.dart';

// Run `flutter packages pub run build_runner build` to generate code.

@UseMoor(
    tables: [Contacts, Notifications], daos: [ContactsDao, NotificationsDao])
class AppDb extends _$AppDb {
  AppDb(Globals globals)
      : super(EncryptedExecutor.inDatabaseFolder(
            path: 'db.sqlite', password: globals.user.keys.secretKey));

  AppDb.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
