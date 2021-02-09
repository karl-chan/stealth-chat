// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SendChatMessage _$SendChatMessageFromJson(Map<String, dynamic> json) {
  return _SendChatMessage.fromJson(json);
}

/// @nodoc
class _$SendChatMessageTearOff {
  const _$SendChatMessageTearOff();

// ignore: unused_element
  _SendChatMessage call({String contactId, String message, int timestamp}) {
    return _SendChatMessage(
      contactId: contactId,
      message: message,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  SendChatMessage fromJson(Map<String, Object> json) {
    return SendChatMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SendChatMessage = _$SendChatMessageTearOff();

/// @nodoc
mixin _$SendChatMessage {
  String get contactId;
  String get message;
  int get timestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SendChatMessageCopyWith<SendChatMessage> get copyWith;
}

/// @nodoc
abstract class $SendChatMessageCopyWith<$Res> {
  factory $SendChatMessageCopyWith(
          SendChatMessage value, $Res Function(SendChatMessage) then) =
      _$SendChatMessageCopyWithImpl<$Res>;
  $Res call({String contactId, String message, int timestamp});
}

/// @nodoc
class _$SendChatMessageCopyWithImpl<$Res>
    implements $SendChatMessageCopyWith<$Res> {
  _$SendChatMessageCopyWithImpl(this._value, this._then);

  final SendChatMessage _value;
  // ignore: unused_field
  final $Res Function(SendChatMessage) _then;

  @override
  $Res call({
    Object contactId = freezed,
    Object message = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      message: message == freezed ? _value.message : message as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

/// @nodoc
abstract class _$SendChatMessageCopyWith<$Res>
    implements $SendChatMessageCopyWith<$Res> {
  factory _$SendChatMessageCopyWith(
          _SendChatMessage value, $Res Function(_SendChatMessage) then) =
      __$SendChatMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId, String message, int timestamp});
}

/// @nodoc
class __$SendChatMessageCopyWithImpl<$Res>
    extends _$SendChatMessageCopyWithImpl<$Res>
    implements _$SendChatMessageCopyWith<$Res> {
  __$SendChatMessageCopyWithImpl(
      _SendChatMessage _value, $Res Function(_SendChatMessage) _then)
      : super(_value, (v) => _then(v as _SendChatMessage));

  @override
  _SendChatMessage get _value => super._value as _SendChatMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object message = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_SendChatMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      message: message == freezed ? _value.message : message as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SendChatMessage implements _SendChatMessage {
  const _$_SendChatMessage({this.contactId, this.message, this.timestamp});

  factory _$_SendChatMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SendChatMessageFromJson(json);

  @override
  final String contactId;
  @override
  final String message;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'SendChatMessage(contactId: $contactId, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendChatMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$SendChatMessageCopyWith<_SendChatMessage> get copyWith =>
      __$SendChatMessageCopyWithImpl<_SendChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SendChatMessageToJson(this);
  }
}

abstract class _SendChatMessage implements SendChatMessage {
  const factory _SendChatMessage(
      {String contactId, String message, int timestamp}) = _$_SendChatMessage;

  factory _SendChatMessage.fromJson(Map<String, dynamic> json) =
      _$_SendChatMessage.fromJson;

  @override
  String get contactId;
  @override
  String get message;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$SendChatMessageCopyWith<_SendChatMessage> get copyWith;
}
