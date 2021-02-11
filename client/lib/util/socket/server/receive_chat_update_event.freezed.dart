// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'receive_chat_update_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReceiveChatUpdateMessage _$ReceiveChatUpdateMessageFromJson(
    Map<String, dynamic> json) {
  return _ReceiveChatUpdateMessage.fromJson(json);
}

/// @nodoc
class _$ReceiveChatUpdateMessageTearOff {
  const _$ReceiveChatUpdateMessageTearOff();

// ignore: unused_element
  _ReceiveChatUpdateMessage call(
      {String contactId, int timestamp, String event, int eventTimestamp}) {
    return _ReceiveChatUpdateMessage(
      contactId: contactId,
      timestamp: timestamp,
      event: event,
      eventTimestamp: eventTimestamp,
    );
  }

// ignore: unused_element
  ReceiveChatUpdateMessage fromJson(Map<String, Object> json) {
    return ReceiveChatUpdateMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReceiveChatUpdateMessage = _$ReceiveChatUpdateMessageTearOff();

/// @nodoc
mixin _$ReceiveChatUpdateMessage {
  String get contactId;
  int get timestamp;
  String get event;
  int get eventTimestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ReceiveChatUpdateMessageCopyWith<ReceiveChatUpdateMessage> get copyWith;
}

/// @nodoc
abstract class $ReceiveChatUpdateMessageCopyWith<$Res> {
  factory $ReceiveChatUpdateMessageCopyWith(ReceiveChatUpdateMessage value,
          $Res Function(ReceiveChatUpdateMessage) then) =
      _$ReceiveChatUpdateMessageCopyWithImpl<$Res>;
  $Res call(
      {String contactId, int timestamp, String event, int eventTimestamp});
}

/// @nodoc
class _$ReceiveChatUpdateMessageCopyWithImpl<$Res>
    implements $ReceiveChatUpdateMessageCopyWith<$Res> {
  _$ReceiveChatUpdateMessageCopyWithImpl(this._value, this._then);

  final ReceiveChatUpdateMessage _value;
  // ignore: unused_field
  final $Res Function(ReceiveChatUpdateMessage) _then;

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
abstract class _$ReceiveChatUpdateMessageCopyWith<$Res>
    implements $ReceiveChatUpdateMessageCopyWith<$Res> {
  factory _$ReceiveChatUpdateMessageCopyWith(_ReceiveChatUpdateMessage value,
          $Res Function(_ReceiveChatUpdateMessage) then) =
      __$ReceiveChatUpdateMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contactId, int timestamp, String event, int eventTimestamp});
}

/// @nodoc
class __$ReceiveChatUpdateMessageCopyWithImpl<$Res>
    extends _$ReceiveChatUpdateMessageCopyWithImpl<$Res>
    implements _$ReceiveChatUpdateMessageCopyWith<$Res> {
  __$ReceiveChatUpdateMessageCopyWithImpl(_ReceiveChatUpdateMessage _value,
      $Res Function(_ReceiveChatUpdateMessage) _then)
      : super(_value, (v) => _then(v as _ReceiveChatUpdateMessage));

  @override
  _ReceiveChatUpdateMessage get _value =>
      super._value as _ReceiveChatUpdateMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object event = freezed,
    Object eventTimestamp = freezed,
  }) {
    return _then(_ReceiveChatUpdateMessage(
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
class _$_ReceiveChatUpdateMessage implements _ReceiveChatUpdateMessage {
  const _$_ReceiveChatUpdateMessage(
      {this.contactId, this.timestamp, this.event, this.eventTimestamp});

  factory _$_ReceiveChatUpdateMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiveChatUpdateMessageFromJson(json);

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
    return 'ReceiveChatUpdateMessage(contactId: $contactId, timestamp: $timestamp, event: $event, eventTimestamp: $eventTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceiveChatUpdateMessage &&
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
  _$ReceiveChatUpdateMessageCopyWith<_ReceiveChatUpdateMessage> get copyWith =>
      __$ReceiveChatUpdateMessageCopyWithImpl<_ReceiveChatUpdateMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiveChatUpdateMessageToJson(this);
  }
}

abstract class _ReceiveChatUpdateMessage implements ReceiveChatUpdateMessage {
  const factory _ReceiveChatUpdateMessage(
      {String contactId,
      int timestamp,
      String event,
      int eventTimestamp}) = _$_ReceiveChatUpdateMessage;

  factory _ReceiveChatUpdateMessage.fromJson(Map<String, dynamic> json) =
      _$_ReceiveChatUpdateMessage.fromJson;

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
  _$ReceiveChatUpdateMessageCopyWith<_ReceiveChatUpdateMessage> get copyWith;
}
