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
  _SendChatMessage call(
      {String contactId, String encrypted, String iv, int timestamp}) {
    return _SendChatMessage(
      contactId: contactId,
      encrypted: encrypted,
      iv: iv,
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
  String get encrypted;
  String get iv;
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
  $Res call({String contactId, String encrypted, String iv, int timestamp});
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
    Object encrypted = freezed,
    Object iv = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
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
  $Res call({String contactId, String encrypted, String iv, int timestamp});
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
    Object encrypted = freezed,
    Object iv = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_SendChatMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SendChatMessage implements _SendChatMessage {
  const _$_SendChatMessage(
      {this.contactId, this.encrypted, this.iv, this.timestamp});

  factory _$_SendChatMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SendChatMessageFromJson(json);

  @override
  final String contactId;
  @override
  final String encrypted;
  @override
  final String iv;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'SendChatMessage(contactId: $contactId, encrypted: $encrypted, iv: $iv, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendChatMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.encrypted, encrypted) ||
                const DeepCollectionEquality()
                    .equals(other.encrypted, encrypted)) &&
            (identical(other.iv, iv) ||
                const DeepCollectionEquality().equals(other.iv, iv)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(encrypted) ^
      const DeepCollectionEquality().hash(iv) ^
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
      {String contactId,
      String encrypted,
      String iv,
      int timestamp}) = _$_SendChatMessage;

  factory _SendChatMessage.fromJson(Map<String, dynamic> json) =
      _$_SendChatMessage.fromJson;

  @override
  String get contactId;
  @override
  String get encrypted;
  @override
  String get iv;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$SendChatMessageCopyWith<_SendChatMessage> get copyWith;
}
