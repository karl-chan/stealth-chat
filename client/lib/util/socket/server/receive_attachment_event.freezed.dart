// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'receive_attachment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReceiveAttachmentMessage _$ReceiveAttachmentMessageFromJson(
    Map<String, dynamic> json) {
  return _ReceiveAttachmentMessage.fromJson(json);
}

/// @nodoc
class _$ReceiveAttachmentMessageTearOff {
  const _$ReceiveAttachmentMessageTearOff();

// ignore: unused_element
  _ReceiveAttachmentMessage call(
      {String contactId, int timestamp, String encrypted, String iv}) {
    return _ReceiveAttachmentMessage(
      contactId: contactId,
      timestamp: timestamp,
      encrypted: encrypted,
      iv: iv,
    );
  }

// ignore: unused_element
  ReceiveAttachmentMessage fromJson(Map<String, Object> json) {
    return ReceiveAttachmentMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReceiveAttachmentMessage = _$ReceiveAttachmentMessageTearOff();

/// @nodoc
mixin _$ReceiveAttachmentMessage {
  String get contactId;
  int get timestamp;
  String get encrypted;
  String get iv;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ReceiveAttachmentMessageCopyWith<ReceiveAttachmentMessage> get copyWith;
}

/// @nodoc
abstract class $ReceiveAttachmentMessageCopyWith<$Res> {
  factory $ReceiveAttachmentMessageCopyWith(ReceiveAttachmentMessage value,
          $Res Function(ReceiveAttachmentMessage) then) =
      _$ReceiveAttachmentMessageCopyWithImpl<$Res>;
  $Res call({String contactId, int timestamp, String encrypted, String iv});
}

/// @nodoc
class _$ReceiveAttachmentMessageCopyWithImpl<$Res>
    implements $ReceiveAttachmentMessageCopyWith<$Res> {
  _$ReceiveAttachmentMessageCopyWithImpl(this._value, this._then);

  final ReceiveAttachmentMessage _value;
  // ignore: unused_field
  final $Res Function(ReceiveAttachmentMessage) _then;

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
abstract class _$ReceiveAttachmentMessageCopyWith<$Res>
    implements $ReceiveAttachmentMessageCopyWith<$Res> {
  factory _$ReceiveAttachmentMessageCopyWith(_ReceiveAttachmentMessage value,
          $Res Function(_ReceiveAttachmentMessage) then) =
      __$ReceiveAttachmentMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId, int timestamp, String encrypted, String iv});
}

/// @nodoc
class __$ReceiveAttachmentMessageCopyWithImpl<$Res>
    extends _$ReceiveAttachmentMessageCopyWithImpl<$Res>
    implements _$ReceiveAttachmentMessageCopyWith<$Res> {
  __$ReceiveAttachmentMessageCopyWithImpl(_ReceiveAttachmentMessage _value,
      $Res Function(_ReceiveAttachmentMessage) _then)
      : super(_value, (v) => _then(v as _ReceiveAttachmentMessage));

  @override
  _ReceiveAttachmentMessage get _value =>
      super._value as _ReceiveAttachmentMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object timestamp = freezed,
    Object encrypted = freezed,
    Object iv = freezed,
  }) {
    return _then(_ReceiveAttachmentMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReceiveAttachmentMessage implements _ReceiveAttachmentMessage {
  const _$_ReceiveAttachmentMessage(
      {this.contactId, this.timestamp, this.encrypted, this.iv});

  factory _$_ReceiveAttachmentMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiveAttachmentMessageFromJson(json);

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
    return 'ReceiveAttachmentMessage(contactId: $contactId, timestamp: $timestamp, encrypted: $encrypted, iv: $iv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceiveAttachmentMessage &&
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
  _$ReceiveAttachmentMessageCopyWith<_ReceiveAttachmentMessage> get copyWith =>
      __$ReceiveAttachmentMessageCopyWithImpl<_ReceiveAttachmentMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiveAttachmentMessageToJson(this);
  }
}

abstract class _ReceiveAttachmentMessage implements ReceiveAttachmentMessage {
  const factory _ReceiveAttachmentMessage(
      {String contactId,
      int timestamp,
      String encrypted,
      String iv}) = _$_ReceiveAttachmentMessage;

  factory _ReceiveAttachmentMessage.fromJson(Map<String, dynamic> json) =
      _$_ReceiveAttachmentMessage.fromJson;

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
  _$ReceiveAttachmentMessageCopyWith<_ReceiveAttachmentMessage> get copyWith;
}
