import 'package:moor/moor.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';

part 'contacts.g.dart';

class Contacts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get chatSecretKey => text()();
  IntColumn get color =>
      integer().withDefault(const Constant(ConstColours.GREEN_700))();
  BlobColumn get avatar => blob().nullable()();
  BlobColumn get wallpaper => blob().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<AppDb> with _$ContactsDaoMixin {
  ContactsDao(AppDb db) : super(db);

  Future<void> addContact(String id, String name, String chatSecretKey) async {
    return into(contacts).insertOnConflictUpdate(ContactsCompanion.insert(
        id: id, name: name, chatSecretKey: chatSecretKey));
  }

  Future<bool> exist(String id) async {
    final found = await (select(contacts)..where((c) => c.id.equals(id))).get();
    return found.isNotEmpty;
  }

  Stream<List<Contact>> listContacts() {
    return (select(contacts)).watch();
  }
}
