import 'package:moor/moor.dart';
import 'package:stealth_chat/util/db/db.dart';

part 'chat_messages.g.dart';

enum AttachmentType { none, photo, video, audio }

class ChatMessages extends Table {
  TextColumn get contactId => text()();
  BoolColumn get isSelf => boolean()();
  TextColumn get message => text()();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get sentTimestamp => dateTime().nullable()();
  DateTimeColumn get deliveredTimestamp => dateTime().nullable()();
  DateTimeColumn get readTimestamp => dateTime().nullable()();
  DateTimeColumn get expiryTimestamp => dateTime().nullable()();
  IntColumn get attachmentType => integer().withDefault(const Constant(0))();
  BlobColumn get attachment => blob().nullable()();

  @override
  Set<Column> get primaryKey => {contactId, timestamp};
}

@UseDao(tables: [
  ChatMessages
], queries: {
  'listLastMessages': '''
      SELECT c.* FROM chat_messages AS c
      INNER JOIN
        (SELECT contact_id, MAX(timestamp) AS max_timestamp
        FROM chat_messages
        GROUP BY contact_id) AS c2
      WHERE c.contact_id = c2.contact_id
      AND   c.timestamp = c2.max_timestamp'''
})
class ChatMessagesDao extends DatabaseAccessor<AppDb>
    with _$ChatMessagesDaoMixin {
  ChatMessagesDao(AppDb db) : super(db);

  Future<void> insertMessage(
    String contactId,
    bool isSelf,
    String message,
    DateTime timestamp,
  ) async {
    return into(chatMessages).insertOnConflictUpdate(
        ChatMessagesCompanion.insert(
            contactId: contactId,
            isSelf: isSelf,
            message: message,
            timestamp: timestamp));
  }

  Future<void> updateSent(
      String contactId, DateTime timestamp, DateTime sentTimestamp) async {
    return (update(chatMessages)
          ..where((m) =>
              m.contactId.equals(contactId) & m.timestamp.equals(timestamp)))
        .write(ChatMessagesCompanion(
      sentTimestamp: Value(sentTimestamp),
    ));
  }

  Future<void> updateDelivered(
      String contactId, DateTime timestamp, DateTime deliveredTimestamp) async {
    return (update(chatMessages)
          ..where((m) =>
              m.contactId.equals(contactId) & m.timestamp.equals(timestamp)))
        .write(ChatMessagesCompanion(
      deliveredTimestamp: Value(deliveredTimestamp),
    ));
  }

  Future<void> updateRead(
      String contactId, DateTime timestamp, DateTime readTimestamp) async {
    return (update(chatMessages)
          ..where((m) =>
              m.contactId.equals(contactId) & m.timestamp.equals(timestamp)))
        .write(ChatMessagesCompanion(
      readTimestamp: Value(readTimestamp),
    ));
  }

  Future<void> updateReadMulti(String contactId, List<DateTime> timestamps,
      DateTime readTimestamp) async {
    if (timestamps.isEmpty) {
      return; // short-circuit optimisation
    }
    return (update(chatMessages)
          ..where((m) =>
              m.contactId.equals(contactId) & m.timestamp.isIn(timestamps)))
        .write(ChatMessagesCompanion(
      readTimestamp: Value(readTimestamp),
    ));
  }

  Stream<List<ChatMessage>> listChatMessages(String contactId) {
    return (select(chatMessages)
          ..where((m) => m.contactId.equals(contactId))
          ..orderBy([(m) => OrderingTerm.desc(m.timestamp)]))
        .watch();
  }

  Future<void> deleteMessages(List<ChatMessage> messages) async {
    return (delete(chatMessages)
          ..where((m) => m.timestamp.isIn(messages.map((m2) => m2.timestamp))))
        .go();
  }
}
