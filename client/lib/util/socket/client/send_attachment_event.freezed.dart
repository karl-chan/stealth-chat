// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_attachment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SendAttachmentMessage _$SendAttachmentMessageFromJson(
    Map<String, dynamic> json) {
  return _SendAttachmentMessage.fromJson(json);
}

/// @nodoc
class _$SendAttachmentMessageTearOff {
  const _$SendAttachmentMessageTearOff();

// ignore: unused_element
  _SendAttachmentMessage call(
      {String contactId, int timestamp, String encrypted, String iv}) {
    return _SendAttachmentMessage(
      contactId: contactId,
      timestamp: timestamp,
      encrypted: encrypted,
      iv: iv,
    );
  }

// ignore: unused_element
  SendAttachmentMessage fromJson(Map<String, Object> json) {
    return SendAttachmentMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SendAttachmentMessage = _$SendAttachmentMessageTearOff();

/// @nodoc
mixin _$SendAttachmentMessage {
  String get contactId;
  int get timestamp;
  String get encrypted;
  String get iv;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SendAttachmentMessageCopyWith<SendAttachmentMessage> get copyWith;
}

/// @nodoc
abstract class $SendAttachmentMessageCopyWith<$Res> {
  factory $SendAttachmentMessageCopyWith(SendAttachmentMessage value,
          $Res Function(SendAttachmentMessage) then) =
      _$SendAttachmentMessageCopyWithImpl<$Res>;
  $Res call({String contactId, int timestamp, String encrypted, String iv});
}

/// @nodoc
class _$SendAttachmentMessageCopyWithImpl<$Res>
    implements $SendAttachmentMessageCopyWith<$Res> {
  _$SendAttachmentMessageCopyWithImpl(this._value, this._then);

  final SendAttachmentMessage _value;
  // ignore: unused_field
  final $Res Function(SendAttachmentMessage) _then;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object encrypted = freezed,
    Object iv = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
    ));
  }
}

/// @nodoc
abstract class _$SendAttachmentMessageCopyWith<$Res>
    implements $SendAttachmentMessageCopyWith<$Res> {
  factory _$SendAttachmentMessageCopyWith(_SendAttachmentMessage value,
          $Res Function(_SendAttachmentMessage) then) =
      __$SendAttachmentMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId, int timestamp, String encrypted, String iv});
}

/// @nodoc
class __$SendAttachmentMessageCopyWithImpl<$Res>
    extends _$SendAttachmentMessageCopyWithImpl<$Res>
    implements _$SendAttachmentMessageCopyWith<$Res> {
  __$SendAttachmentMessageCopyWithImpl(_SendAttachmentMessage _value,
      $Res Function(_SendAttachmentMessage) _then)
      : super(_value, (v) => _then(v as _SendAttachmentMessage));

  @override
  _SendAttachmentMessage get _value => super._value as _SendAttachmentMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object encrypted = freezed,
    Object iv = freezed,
  }) {
    return _then(_SendAttachmentMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SendAttachmentMessage implements _SendAttachmentMessage {
  const _$_SendAttachmentMessage(
      {this.contactId, this.timestamp, this.encrypted, this.iv});

  factory _$_SendAttachmentMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SendAttachmentMessageFromJson(json);

  @override
  final String contactId;
  @override
  final int timestamp;
  @override
  final String encrypted;
  @override
  final String iv;

  @override
  String toString() {
    return 'SendAttachmentMessage(contactId: $contactId, timestamp: $timestamp, encrypted: $encrypted, iv: $iv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendAttachmentMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.encrypted, encrypted) ||
                const DeepCollectionEquality()
                    .equals(other.encrypted, encrypted)) &&
            (identical(other.iv, iv) ||
                const DeepCollectionEquality().equals(other.iv, iv)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(encrypted) ^
      const DeepCollectionEquality().hash(iv);

  @JsonKey(ignore: true)
  @override
  _$SendAttachmentMessageCopyWith<_SendAttachmentMessage> get copyWith =>
      __$SendAttachmentMessageCopyWithImpl<_SendAttachmentMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SendAttachmentMessageToJson(this);
  }
}

abstract class _SendAttachmentMessage implements SendAttachmentMessage {
  const factory _SendAttachmentMessage(
      {String contactId,
      int timestamp,
      String encrypted,
      String iv}) = _$_SendAttachmentMessage;

  factory _SendAttachmentMessage.fromJson(Map<String, dynamic> json) =
      _$_SendAttachmentMessage.fromJson;

  @override
  String get contactId;
  @override
  int get timestamp;
  @override
  String get encrypted;
  @override
  String get iv;
  @override
  @JsonKey(ignore: true)
  _$SendAttachmentMessageCopyWith<_SendAttachmentMessage> get copyWith;
}
