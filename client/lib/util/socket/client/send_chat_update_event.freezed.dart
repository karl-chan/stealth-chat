// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_chat_update_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SendChatUpdateMessage _$SendChatUpdateMessageFromJson(
    Map<String, dynamic> json) {
  return _SendChatUpdateMessage.fromJson(json);
}

/// @nodoc
class _$SendChatUpdateMessageTearOff {
  const _$SendChatUpdateMessageTearOff();

// ignore: unused_element
  _SendChatUpdateMessage call(
      {String contactId, int timestamp, String event, int eventTimestamp}) {
    return _SendChatUpdateMessage(
      contactId: contactId,
      timestamp: timestamp,
      event: event,
      eventTimestamp: eventTimestamp,
    );
  }

// ignore: unused_element
  SendChatUpdateMessage fromJson(Map<String, Object> json) {
    return SendChatUpdateMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SendChatUpdateMessage = _$SendChatUpdateMessageTearOff();

/// @nodoc
mixin _$SendChatUpdateMessage {
  String get contactId;
  int get timestamp;
  String get event;
  int get eventTimestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SendChatUpdateMessageCopyWith<SendChatUpdateMessage> get copyWith;
}

/// @nodoc
abstract class $SendChatUpdateMessageCopyWith<$Res> {
  factory $SendChatUpdateMessageCopyWith(SendChatUpdateMessage value,
          $Res Function(SendChatUpdateMessage) then) =
      _$SendChatUpdateMessageCopyWithImpl<$Res>;
  $Res call(
      {String contactId, int timestamp, String event, int eventTimestamp});
}

/// @nodoc
class _$SendChatUpdateMessageCopyWithImpl<$Res>
    implements $SendChatUpdateMessageCopyWith<$Res> {
  _$SendChatUpdateMessageCopyWithImpl(this._value, this._then);

  final SendChatUpdateMessage _value;
  // ignore: unused_field
  final $Res Function(SendChatUpdateMessage) _then;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object event = freezed,
    Object eventTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      event: event == freezed ? _value.event : event as String,
      eventTimestamp: eventTimestamp == freezed
          ? _value.eventTimestamp
          : eventTimestamp as int,
    ));
  }
}

/// @nodoc
abstract class _$SendChatUpdateMessageCopyWith<$Res>
    implements $SendChatUpdateMessageCopyWith<$Res> {
  factory _$SendChatUpdateMessageCopyWith(_SendChatUpdateMessage value,
          $Res Function(_SendChatUpdateMessage) then) =
      __$SendChatUpdateMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contactId, int timestamp, String event, int eventTimestamp});
}

/// @nodoc
class __$SendChatUpdateMessageCopyWithImpl<$Res>
    extends _$SendChatUpdateMessageCopyWithImpl<$Res>
    implements _$SendChatUpdateMessageCopyWith<$Res> {
  __$SendChatUpdateMessageCopyWithImpl(_SendChatUpdateMessage _value,
      $Res Function(_SendChatUpdateMessage) _then)
      : super(_value, (v) => _then(v as _SendChatUpdateMessage));

  @override
  _SendChatUpdateMessage get _value => super._value as _SendChatUpdateMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object event = freezed,
    Object eventTimestamp = freezed,
  }) {
    return _then(_SendChatUpdateMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      event: event == freezed ? _value.event : event as String,
      eventTimestamp: eventTimestamp == freezed
          ? _value.eventTimestamp
          : eventTimestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SendChatUpdateMessage implements _SendChatUpdateMessage {
  const _$_SendChatUpdateMessage(
      {this.contactId, this.timestamp, this.event, this.eventTimestamp});

  factory _$_SendChatUpdateMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SendChatUpdateMessageFromJson(json);

  @override
  final String contactId;
  @override
  final int timestamp;
  @override
  final String event;
  @override
  final int eventTimestamp;

  @override
  String toString() {
    return 'SendChatUpdateMessage(contactId: $contactId, timestamp: $timestamp, event: $event, eventTimestamp: $eventTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendChatUpdateMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)) &&
            (identical(other.eventTimestamp, eventTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.eventTimestamp, eventTimestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(event) ^
      const DeepCollectionEquality().hash(eventTimestamp);

  @JsonKey(ignore: true)
  @override
  _$SendChatUpdateMessageCopyWith<_SendChatUpdateMessage> get copyWith =>
      __$SendChatUpdateMessageCopyWithImpl<_SendChatUpdateMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SendChatUpdateMessageToJson(this);
  }
}

abstract class _SendChatUpdateMessage implements SendChatUpdateMessage {
  const factory _SendChatUpdateMessage(
      {String contactId,
      int timestamp,
      String event,
      int eventTimestamp}) = _$_SendChatUpdateMessage;

  factory _SendChatUpdateMessage.fromJson(Map<String, dynamic> json) =
      _$_SendChatUpdateMessage.fromJson;

  @override
  String get contactId;
  @override
  int get timestamp;
  @override
  String get event;
  @override
  int get eventTimestamp;
  @override
  @JsonKey(ignore: true)
  _$SendChatUpdateMessageCopyWith<_SendChatUpdateMessage> get copyWith;
}
