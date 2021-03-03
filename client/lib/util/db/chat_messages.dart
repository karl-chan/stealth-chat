import 'package:moor/moor.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/util/db/db.dart';

part 'chat_messages.g.dart';

class ChatMessages extends Table {
  TextColumn get contactId => text()();
  BoolColumn get isSelf => boolean()();
  TextColumn get message => text().withDefault(const Constant(''))();
  DateTimeColumn get timestamp => dateTime()();
  DateTimeColumn get sentTimestamp => dateTime().nullable()();
  DateTimeColumn get deliveredTimestamp => dateTime().nullable()();
  DateTimeColumn get readTimestamp => dateTime().nullable()();
  DateTimeColumn get expiryTimestamp => dateTime().nullable()();
  IntColumn get attachmentType => integer().withDefault(const Constant(0))();
  TextColumn get attachmentName => text().nullable()();
  BlobColumn get attachment => blob().nullable()();

  @override
  Set<Column> get primaryKey => {contactId, timestamp};
}

@UseDao(tables: [ChatMessages], include: {'chat_messages.moor'})
class ChatMessagesDao extends DatabaseAccessor<AppDb>
    with _$ChatMessagesDaoMixin {
  ChatMessagesDao(AppDb db) : super(db);

  Future<void> insertMessage(
      String contactId, bool isSelf, String message, DateTime timestamp) async {
    return into(chatMessages).insertOnConflictUpdate(
        ChatMessagesCompanion.insert(
            contactId: contactId,
            isSelf: isSelf,
            message: Value(message),
            timestamp: timestamp));
  }

  Future<void> insertAttachment(String contactId, bool isSelf,
      DateTime timestamp, Attachment attachment) async {
    return into(chatMessages).insertOnConflictUpdate(
        ChatMessagesCompanion.insert(
            contactId: contactId,
            isSelf: isSelf,
            timestamp: timestamp,
            attachmentType: Value(attachment.type.index),
            attachmentName: Value(attachment.name),
            attachment: Value(attachment.value)));
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

  Stream<List<ChatMessage>> listMostRecentMessages() {
    return mostRecentMessages().watch();
  }

  Stream<Map<String, int>> countUnreadMessages() {
    final contactId = chatMessages.contactId;
    final numUnread = chatMessages.timestamp.count();
    return (selectOnly(chatMessages)
          ..addColumns([contactId, numUnread])
          ..where(isNull(chatMessages.readTimestamp) &
              chatMessages.isSelf.equals(false))
          ..groupBy([contactId]))
        .watch()
        .map((result) => {
              for (final row in result) row.read(contactId): row.read(numUnread)
            });
  }

  Future<void> deleteMessages(List<ChatMessage> messages) async {
    return (delete(chatMessages)
          ..where((m) => m.timestamp.isIn(messages.map((m2) => m2.timestamp))))
        .go();
  }
}
