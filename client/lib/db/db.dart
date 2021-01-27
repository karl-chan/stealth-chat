import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:stealth_chat/db/contacts.dart';
import 'package:stealth_chat/globals.dart';

part 'db.g.dart';

// Run `flutter packages pub run build_runner build` to generate code.

@UseMoor(tables: [Contacts], daos: [ContactsDao])
class AppDb extends _$AppDb {
  AppDb(Globals globals) : super(_openConnection(globals));

  AppDb.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(Globals globals) {
  return LazyDatabase(() async {
    String password = globals.user.keys.secretKey;

    return EncryptedExecutor.inDatabaseFolder(
        path: 'db.sqlite', password: password);
  });
}
