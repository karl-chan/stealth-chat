import 'package:crypton/crypton.dart';
import 'package:moor/moor.dart';
import 'package:stealth_chat/db/db.dart';

part 'contacts.g.dart';

class Contacts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get publicKey => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<AppDb> with _$ContactsDaoMixin {
  ContactsDao(AppDb db) : super(db);

  Future<void> addContact(
      String id, String name, RSAPublicKey publicKey) async {
    return into(contacts).insertOnConflictUpdate(
        Contact(id: id, name: name, publicKey: publicKey.toPEM()));
  }

  Future<bool> exist(String id) async {
    final found = await (select(contacts)..where((c) => c.id.equals(id))).get();
    return found.isNotEmpty;
  }

  Stream<List<Contact>> listContacts() {
    return (select(contacts)).watch();
  }
}
