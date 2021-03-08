import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'archive_contact_event.freezed.dart';
part 'archive_contact_event.g.dart';

class ArchiveContactEvent extends ServerEvent<ArchiveContactMessage> {
  ArchiveContactEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'ARCHIVE_CONTACT',
            (data) => ArchiveContactMessage.fromJson(data),
            callback: (message) async {
          await globals.db.contacts.archiveContact(message.contactId);
        });
}

@freezed
abstract class ArchiveContactMessage with _$ArchiveContactMessage {
  const factory ArchiveContactMessage({String contactId}) =
      _ArchiveContactMessage;

  factory ArchiveContactMessage.fromJson(Map<String, dynamic> json) =>
      _$ArchiveContactMessageFromJson(json);
}
