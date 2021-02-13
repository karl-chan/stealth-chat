// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'send_status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SendStatusMessage _$SendStatusMessageFromJson(Map<String, dynamic> json) {
  return _SendStatusMessage.fromJson(json);
}

/// @nodoc
class _$SendStatusMessageTearOff {
  const _$SendStatusMessageTearOff();

// ignore: unused_element
  _SendStatusMessage call(
      {List<String> contactIds, bool online, int lastSeen}) {
    return _SendStatusMessage(
      contactIds: contactIds,
      online: online,
      lastSeen: lastSeen,
    );
  }

// ignore: unused_element
  SendStatusMessage fromJson(Map<String, Object> json) {
    return SendStatusMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SendStatusMessage = _$SendStatusMessageTearOff();

/// @nodoc
mixin _$SendStatusMessage {
  List<String> get contactIds;
  bool get online;
  int get lastSeen;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SendStatusMessageCopyWith<SendStatusMessage> get copyWith;
}

/// @nodoc
abstract class $SendStatusMessageCopyWith<$Res> {
  factory $SendStatusMessageCopyWith(
          SendStatusMessage value, $Res Function(SendStatusMessage) then) =
      _$SendStatusMessageCopyWithImpl<$Res>;
  $Res call({List<String> contactIds, bool online, int lastSeen});
}

/// @nodoc
class _$SendStatusMessageCopyWithImpl<$Res>
    implements $SendStatusMessageCopyWith<$Res> {
  _$SendStatusMessageCopyWithImpl(this._value, this._then);

  final SendStatusMessage _value;
  // ignore: unused_field
  final $Res Function(SendStatusMessage) _then;

  @override
  $Res call({
    Object contactIds = freezed,
    Object online = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_value.copyWith(
      contactIds: contactIds == freezed
          ? _value.contactIds
          : contactIds as List<String>,
      online: online == freezed ? _value.online : online as bool,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as int,
    ));
  }
}

/// @nodoc
abstract class _$SendStatusMessageCopyWith<$Res>
    implements $SendStatusMessageCopyWith<$Res> {
  factory _$SendStatusMessageCopyWith(
          _SendStatusMessage value, $Res Function(_SendStatusMessage) then) =
      __$SendStatusMessageCopyWithImpl<$Res>;
  @override
  $Res call({List<String> contactIds, bool online, int lastSeen});
}

/// @nodoc
class __$SendStatusMessageCopyWithImpl<$Res>
    extends _$SendStatusMessageCopyWithImpl<$Res>
    implements _$SendStatusMessageCopyWith<$Res> {
  __$SendStatusMessageCopyWithImpl(
      _SendStatusMessage _value, $Res Function(_SendStatusMessage) _then)
      : super(_value, (v) => _then(v as _SendStatusMessage));

  @override
  _SendStatusMessage get _value => super._value as _SendStatusMessage;

  @override
  $Res call({
    Object contactIds = freezed,
    Object online = freezed,
    Object lastSeen = freezed,
  }) {
    return _then(_SendStatusMessage(
      contactIds: contactIds == freezed
          ? _value.contactIds
          : contactIds as List<String>,
      online: online == freezed ? _value.online : online as bool,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SendStatusMessage implements _SendStatusMessage {
  const _$_SendStatusMessage({this.contactIds, this.online, this.lastSeen});

  factory _$_SendStatusMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_SendStatusMessageFromJson(json);

  @override
  final List<String> contactIds;
  @override
  final bool online;
  @override
  final int lastSeen;

  @override
  String toString() {
    return 'SendStatusMessage(contactIds: $contactIds, online: $online, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SendStatusMessage &&
            (identical(other.contactIds, contactIds) ||
                const DeepCollectionEquality()
                    .equals(other.contactIds, contactIds)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactIds) ^
      const DeepCollectionEquality().hash(online) ^
      const DeepCollectionEquality().hash(lastSeen);

  @JsonKey(ignore: true)
  @override
  _$SendStatusMessageCopyWith<_SendStatusMessage> get copyWith =>
      __$SendStatusMessageCopyWithImpl<_SendStatusMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SendStatusMessageToJson(this);
  }
}

abstract class _SendStatusMessage implements SendStatusMessage {
  const factory _SendStatusMessage(
      {List<String> contactIds,
      bool online,
      int lastSeen}) = _$_SendStatusMessage;

  factory _SendStatusMessage.fromJson(Map<String, dynamic> json) =
      _$_SendStatusMessage.fromJson;

  @override
  List<String> get contactIds;
  @override
  bool get online;
  @override
  int get lastSeen;
  @override
  @JsonKey(ignore: true)
  _$SendStatusMessageCopyWith<_SendStatusMessage> get copyWith;
}
