// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatMessagesDaoMixin on DatabaseAccessor<AppDb> {
  $ChatMessagesTable get chatMessages => attachedDatabase.chatMessages;
  Selectable<ChatMessage> listLastMessages() {
    return customSelect(
        'SELECT c.* FROM chat_messages AS c\n      INNER JOIN\n        (SELECT contact_id, MAX(timestamp) AS max_timestamp\n        FROM chat_messages\n        GROUP BY contact_id) AS c2\n      WHERE c.contact_id = c2.contact_id\n      AND   c.timestamp = c2.max_timestamp',
        variables: [],
        readsFrom: {chatMessages}).map(chatMessages.mapFromRow);
  }
}
