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
  BoolColumn get online => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastSeen => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<AppDb> with _$ContactsDaoMixin {
  ContactsDao(AppDb db) : super(db);

  Future<void> addContact(
      String id, String name, String chatSecretKey, DateTime lastSeen) async {
    return into(contacts).insertOnConflictUpdate(ContactsCompanion.insert(
        id: id, name: name, chatSecretKey: chatSecretKey, lastSeen: lastSeen));
  }

  Future<bool> exist(String id) async {
    final contact = getContact(id);
    return contact != null;
  }

  Future<Contact> getContact(String id) async {
    return (select(contacts)..where((c) => c.id.equals(id))).getSingle();
  }

  Stream<Contact> watchContact(String id) {
    return (select(contacts)..where((c) => c.id.equals(id))).watchSingle();
  }

  Future<List<String>> getContactIds() async {
    return (selectOnly(contacts)..addColumns([contacts.id]))
        .map((c) => c.read(contacts.id))
        .get();
  }

  Stream<List<Contact>> listContacts() {
    return (select(contacts)).watch();
  }

  Future<void> updateStatus(String id, bool online, DateTime lastSeen) {
    return (update(contacts)..where((c) => c.id.equals(id))).write(
        ContactsCompanion(online: Value(online), lastSeen: Value(lastSeen)));
  }
}
