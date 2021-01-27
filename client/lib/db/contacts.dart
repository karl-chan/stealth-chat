import 'package:moor/moor.dart';
import 'package:stealth_chat/db/db.dart';

part 'contacts.g.dart';

class Contacts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get publicKey => text()();
}

@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<AppDb> with _$ContactsDaoMixin {
  ContactsDao(AppDb db) : super(db);

  Future<void> addContact(String id, String name, String publicKey) async {
    await into(contacts)
        .insert(Contact(id: id, name: name, publicKey: publicKey));
  }

  Stream<List<Contact>> listContacts() {
    return (select(contacts)).watch();
  }
}
