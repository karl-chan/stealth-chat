// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'receive_status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReceiveStatusMessage _$ReceiveStatusMessageFromJson(Map<String, dynamic> json) {
  return _ReceiveStatusMessage.fromJson(json);
}

/// @nodoc
class _$ReceiveStatusMessageTearOff {
  const _$ReceiveStatusMessageTearOff();

// ignore: unused_element
  _ReceiveStatusMessage call({String contactId, bool online, int lastSeen}) {
    return _ReceiveStatusMessage(
      contactId: contactId,
      online: online,
      lastSeen: lastSeen,
    );
  }

// ignore: unused_element
  ReceiveStatusMessage fromJson(Map<String, Object> json) {
    return ReceiveStatusMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReceiveStatusMessage = _$ReceiveStatusMessageTearOff();

/// @nodoc
mixin _$ReceiveStatusMessage {
  String get contactId;
  bool get online;
  int get lastSeen;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ReceiveStatusMessageCopyWith<ReceiveStatusMessage> get copyWith;
}

/// @nodoc
abstract class $ReceiveStatusMessageCopyWith<$Res> {
  factory $ReceiveStatusMessageCopyWith(ReceiveStatusMessage value,
          $Res Function(ReceiveStatusMessage) then) =
      _$ReceiveStatusMessageCopyWithImpl<$Res>;
  $Res call({String contactId, bool online, int lastSeen});
}

/// @nodoc
class _$ReceiveStatusMessageCopyWithImpl<$Res>
    implements $ReceiveStatusMessageCopyWith<$Res> {
  _$ReceiveStatusMessageCopyWithImpl(this._value, this._then);

  final ReceiveStatusMessage _value;
  // ignore: unused_field
  final $Res Function(ReceiveStatusMessage) _then;

  @override
  $Res call({
    Object contactId = freezed,
    Object online = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      online: online == freezed ? _value.online : online as bool,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as int,
    ));
  }
}

/// @nodoc
abstract class _$ReceiveStatusMessageCopyWith<$Res>
    implements $ReceiveStatusMessageCopyWith<$Res> {
  factory _$ReceiveStatusMessageCopyWith(_ReceiveStatusMessage value,
          $Res Function(_ReceiveStatusMessage) then) =
      __$ReceiveStatusMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId, bool online, int lastSeen});
}

/// @nodoc
class __$ReceiveStatusMessageCopyWithImpl<$Res>
    extends _$ReceiveStatusMessageCopyWithImpl<$Res>
    implements _$ReceiveStatusMessageCopyWith<$Res> {
  __$ReceiveStatusMessageCopyWithImpl(
      _ReceiveStatusMessage _value, $Res Function(_ReceiveStatusMessage) _then)
      : super(_value, (v) => _then(v as _ReceiveStatusMessage));

  @override
  _ReceiveStatusMessage get _value => super._value as _ReceiveStatusMessage;

  @override
  $Res call({
    Object contactId = freezed,
    Object online = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_ReceiveStatusMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
      online: online == freezed ? _value.online : online as bool,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ReceiveStatusMessage implements _ReceiveStatusMessage {
  const _$_ReceiveStatusMessage({this.contactId, this.online, this.lastSeen});

  factory _$_ReceiveStatusMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiveStatusMessageFromJson(json);

  @override
  final String contactId;
  @override
  final bool online;
  @override
  final int lastSeen;

  @override
  String toString() {
    return 'ReceiveStatusMessage(contactId: $contactId, online: $online, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReceiveStatusMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactId) ^
      const DeepCollectionEquality().hash(online) ^
      const DeepCollectionEquality().hash(lastSeen);

  @JsonKey(ignore: true)
  @override
  _$ReceiveStatusMessageCopyWith<_ReceiveStatusMessage> get copyWith =>
      __$ReceiveStatusMessageCopyWithImpl<_ReceiveStatusMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiveStatusMessageToJson(this);
  }
}

abstract class _ReceiveStatusMessage implements ReceiveStatusMessage {
  const factory _ReceiveStatusMessage(
      {String contactId, bool online, int lastSeen}) = _$_ReceiveStatusMessage;

  factory _ReceiveStatusMessage.fromJson(Map<String, dynamic> json) =
      _$_ReceiveStatusMessage.fromJson;

  @override
  String get contactId;
  @override
  bool get online;
  @override
  int get lastSeen;
  @override
  @JsonKey(ignore: true)
  _$ReceiveStatusMessageCopyWith<_ReceiveStatusMessage> get copyWith;
}
