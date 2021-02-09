// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'receive_chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReceiveChatMessage _$ReceiveChatMessageFromJson(Map<String, dynamic> json) {
  return _ReceiveChatMessage.fromJson(json);
}

/// @nodoc
class _$ReceiveChatMessageTearOff {
  const _$ReceiveChatMessageTearOff();

// ignore: unused_element
  _ReceiveChatMessage call({String contactId, String message, int timestamp}) {
    return _ReceiveChatMessage(
      contactId: contactId,
      message: message,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  ReceiveChatMessage fromJson(Map<String, Object> json) {
    return ReceiveChatMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReceiveChatMessage = _$ReceiveChatMessageTearOff();

/// @nodoc
mixin _$ReceiveChatMessage {
  String get contactId;
  String get message;
  int get timestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ReceiveChatMessageCopyWith<ReceiveChatMessage> get copyWith;
}

/// @nodoc
abstract class $ReceiveChatMessageCopyWith<$Res> {
  factory $ReceiveChatMessageCopyWith(
          ReceiveChatMessage value, $Res Function(ReceiveChatMessage) then) =
      _$ReceiveChatMessageCopyWithImpl<$Res>;
  $Res call({String contactId, String message, int timestamp});
}

/// @nodoc
class _$ReceiveChatMessageCopyWithImpl<$Res>
    implements $ReceiveChatMessageCopyWith<$Res> {
  _$ReceiveChatMessageCopyWithImpl(this._value, this._then);

  final ReceiveChatMessage _value;
  // ignore: unused_field
  final $Res Function(ReceiveChatMessage) _then;

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
abstract class _$ReceiveChatMessageCopyWith<$Res>
    implements $ReceiveChatMessageCopyWith<$Res> {
  factory _$ReceiveChatMessageCopyWith(
          _ReceiveChatMessage value, $Res Function(_ReceiveChatMessage) then) =
      __$ReceiveChatMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId, String message, int timestamp});
}

/// @nodoc
class __$ReceiveChatMessageCopyWithImpl<$Res>
    extends _$ReceiveChatMessageCopyWithImpl<$Res>
    implements _$ReceiveChatMessageCopyWith<$Res> {
  __$ReceiveChatMessageCopyWithImpl(
      _ReceiveChatMessage _value, $Res Function(_ReceiveChatMessage) _then)
      : super(_value, (v) => _then(v as _ReceiveChatMessage));

  @override
  _ReceiveChatMessage get _value => super._value as _ReceiveChatMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object message = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_ReceiveChatMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      message: message == freezed ? _value.message : message as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReceiveChatMessage implements _ReceiveChatMessage {
  const _$_ReceiveChatMessage({this.contactId, this.message, this.timestamp});

  factory _$_ReceiveChatMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiveChatMessageFromJson(json);

  @override
  final String contactId;
  @override
  final String message;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'ReceiveChatMessage(contactId: $contactId, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceiveChatMessage &&
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
  _$ReceiveChatMessageCopyWith<_ReceiveChatMessage> get copyWith =>
      __$ReceiveChatMessageCopyWithImpl<_ReceiveChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiveChatMessageToJson(this);
  }
}

abstract class _ReceiveChatMessage implements ReceiveChatMessage {
  const factory _ReceiveChatMessage(
      {String contactId,
      String message,
      int timestamp}) = _$_ReceiveChatMessage;

  factory _ReceiveChatMessage.fromJson(Map<String, dynamic> json) =
      _$_ReceiveChatMessage.fromJson;

  @override
  String get contactId;
  @override
  String get message;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$ReceiveChatMessageCopyWith<_ReceiveChatMessage> get copyWith;
}
