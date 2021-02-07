// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'invite_accepted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
InviteAcceptedMessage _$InviteAcceptedMessageFromJson(
    Map<String, dynamic> json) {
  return _InviteAcceptedMessage.fromJson(json);
}

/// @nodoc
class _$InviteAcceptedMessageTearOff {
  const _$InviteAcceptedMessageTearOff();

// ignore: unused_element
  _InviteAcceptedMessage call(
      {String id, String name, String publicKey, int timestamp}) {
    return _InviteAcceptedMessage(
      id: id,
      name: name,
      publicKey: publicKey,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  InviteAcceptedMessage fromJson(Map<String, Object> json) {
    return InviteAcceptedMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $InviteAcceptedMessage = _$InviteAcceptedMessageTearOff();

/// @nodoc
mixin _$InviteAcceptedMessage {
  String get id;
  String get name;
  String get publicKey;
  int get timestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $InviteAcceptedMessageCopyWith<InviteAcceptedMessage> get copyWith;
}

/// @nodoc
abstract class $InviteAcceptedMessageCopyWith<$Res> {
  factory $InviteAcceptedMessageCopyWith(InviteAcceptedMessage value,
          $Res Function(InviteAcceptedMessage) then) =
      _$InviteAcceptedMessageCopyWithImpl<$Res>;
  $Res call({String id, String name, String publicKey, int timestamp});
}

/// @nodoc
class _$InviteAcceptedMessageCopyWithImpl<$Res>
    implements $InviteAcceptedMessageCopyWith<$Res> {
  _$InviteAcceptedMessageCopyWithImpl(this._value, this._then);

  final InviteAcceptedMessage _value;
  // ignore: unused_field
  final $Res Function(InviteAcceptedMessage) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object publicKey = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      publicKey: publicKey == freezed ? _value.publicKey : publicKey as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

/// @nodoc
abstract class _$InviteAcceptedMessageCopyWith<$Res>
    implements $InviteAcceptedMessageCopyWith<$Res> {
  factory _$InviteAcceptedMessageCopyWith(_InviteAcceptedMessage value,
          $Res Function(_InviteAcceptedMessage) then) =
      __$InviteAcceptedMessageCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String publicKey, int timestamp});
}

/// @nodoc
class __$InviteAcceptedMessageCopyWithImpl<$Res>
    extends _$InviteAcceptedMessageCopyWithImpl<$Res>
    implements _$InviteAcceptedMessageCopyWith<$Res> {
  __$InviteAcceptedMessageCopyWithImpl(_InviteAcceptedMessage _value,
      $Res Function(_InviteAcceptedMessage) _then)
      : super(_value, (v) => _then(v as _InviteAcceptedMessage));

  @override
  _InviteAcceptedMessage get _value => super._value as _InviteAcceptedMessage;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object publicKey = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_InviteAcceptedMessage(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      publicKey: publicKey == freezed ? _value.publicKey : publicKey as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_InviteAcceptedMessage implements _InviteAcceptedMessage {
  const _$_InviteAcceptedMessage(
      {this.id, this.name, this.publicKey, this.timestamp});

  factory _$_InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_InviteAcceptedMessageFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String publicKey;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'InviteAcceptedMessage(id: $id, name: $name, publicKey: $publicKey, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InviteAcceptedMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$InviteAcceptedMessageCopyWith<_InviteAcceptedMessage> get copyWith =>
      __$InviteAcceptedMessageCopyWithImpl<_InviteAcceptedMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InviteAcceptedMessageToJson(this);
  }
}

abstract class _InviteAcceptedMessage implements InviteAcceptedMessage {
  const factory _InviteAcceptedMessage(
      {String id,
      String name,
      String publicKey,
      int timestamp}) = _$_InviteAcceptedMessage;

  factory _InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =
      _$_InviteAcceptedMessage.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get publicKey;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$InviteAcceptedMessageCopyWith<_InviteAcceptedMessage> get copyWith;
}
