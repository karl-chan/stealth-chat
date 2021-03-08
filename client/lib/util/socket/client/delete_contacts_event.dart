import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'delete_contacts_event.freezed.dart';
part 'delete_contacts_event.g.dart';

class DeleteContactsEvent extends ClientEvent<DeleteContactsMessage> {
  DeleteContactsEvent(PhoenixChannel channel)
      : super(channel, 'DELETE_CONTACTS', (message) => message.toJson());
}

@freezed
abstract class DeleteContactsMessage with _$DeleteContactsMessage {
  const factory DeleteContactsMessage({List<String> contactIds}) =
      _DeleteContactsMessage;

  factory DeleteContactsMessage.fromJson(Map<String, dynamic> json) =>
      _$DeleteContactsMessageFromJson(json);
}
