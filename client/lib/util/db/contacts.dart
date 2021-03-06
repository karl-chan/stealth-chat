import 'package:flutter/material.dart' show Color;
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
  BoolColumn get archived => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseDao(tables: [Contacts])
class ContactsDao extends DatabaseAccessor<AppDb> with _$ContactsDaoMixin {
  ContactsDao(AppDb db) : super(db);

  Future<void> addContact(
      String id, String name, String chatSecretKey, DateTime lastSeen) async {
    return into(contacts).insertOnConflictUpdate(ContactsCompanion.insert(
        id: id,
        name: name,
        chatSecretKey: chatSecretKey,
        lastSeen: lastSeen,
        archived: false));
  }

  Future<bool> exist(String id) async {
    final contact = await getContact(id);
    return contact != null;
  }

  Future<Contact> getContact(String id) async {
    return (select(contacts)..where((c) => c.id.equals(id))).getSingle();
  }

  Stream<Contact> watchContact(String id) {
    return (select(contacts)..where((c) => c.id.equals(id))).watchSingle();
  }

  Future<void> deleteContacts(List<String> ids) async {
    return (delete(contacts)..where((c) => c.id.isIn(ids))).go();
  }

  Future<List<String>> getContactIds() async {
    return (selectOnly(contacts)..addColumns([contacts.id]))
        .map((c) => c.read(contacts.id))
        .get();
  }

  Stream<List<Contact>> listContacts() {
    return (select(contacts)).watch();
  }

  Future<void> changeName(String id, String name) {
    return (update(contacts)..where((c) => c.id.equals(id)))
        .write(ContactsCompanion(name: Value(name)));
  }

  Future<void> changeColour(String id, Color colour) {
    return (update(contacts)..where((c) => c.id.equals(id)))
        .write(ContactsCompanion(color: Value(colour.value)));
  }

  Future<void> setWallpaper(String id, Uint8List wallpaper) {
    return (update(contacts)..where((c) => c.id.equals(id)))
        .write(ContactsCompanion(wallpaper: Value(wallpaper)));
  }

  Future<void> updateStatus(String id, bool online, DateTime lastSeen) {
    return (update(contacts)..where((c) => c.id.equals(id))).write(
        ContactsCompanion(online: Value(online), lastSeen: Value(lastSeen)));
  }

  Future<void> archiveContact(String id) {
    return (update(contacts)..where((c) => c.id.equals(id)))
        .write(ContactsCompanion(archived: Value(true)));
  }
}
