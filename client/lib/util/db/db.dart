import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/chat_messages.dart';
import 'package:stealth_chat/util/db/contacts.dart';
import 'package:stealth_chat/util/db/notifications.dart';

part 'db.g.dart';

// Run `flutter packages pub run build_runner build` to generate code.

@UseMoor(
    tables: [ChatMessages, Contacts, Notifications],
    daos: [ChatMessagesDao, ContactsDao, NotificationsDao])
class AppDb extends _$AppDb {
  AppDb(Globals globals)
      : super(EncryptedExecutor.inDatabaseFolder(
            path: 'db.sqlite', password: globals.user.keys.secretKey));

  AppDb.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
