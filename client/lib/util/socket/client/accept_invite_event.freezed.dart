// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'accept_invite_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AcceptInviteMessage _$AcceptInviteMessageFromJson(Map<String, dynamic> json) {
  return _AcceptInviteMessage.fromJson(json);
}

/// @nodoc
class _$AcceptInviteMessageTearOff {
  const _$AcceptInviteMessageTearOff();

// ignore: unused_element
  _AcceptInviteMessage call({String their_id, String my_name}) {
    return _AcceptInviteMessage(
      their_id: their_id,
      my_name: my_name,
    );
  }

// ignore: unused_element
  AcceptInviteMessage fromJson(Map<String, Object> json) {
    return AcceptInviteMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AcceptInviteMessage = _$AcceptInviteMessageTearOff();

/// @nodoc
mixin _$AcceptInviteMessage {
  String get their_id;
  String get my_name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AcceptInviteMessageCopyWith<AcceptInviteMessage> get copyWith;
}

/// @nodoc
abstract class $AcceptInviteMessageCopyWith<$Res> {
  factory $AcceptInviteMessageCopyWith(
          AcceptInviteMessage value, $Res Function(AcceptInviteMessage) then) =
      _$AcceptInviteMessageCopyWithImpl<$Res>;
  $Res call({String their_id, String my_name});
}

/// @nodoc
class _$AcceptInviteMessageCopyWithImpl<$Res>
    implements $AcceptInviteMessageCopyWith<$Res> {
  _$AcceptInviteMessageCopyWithImpl(this._value, this._then);

  final AcceptInviteMessage _value;
  // ignore: unused_field
  final $Res Function(AcceptInviteMessage) _then;

  @override
  $Res call({
    Object their_id = freezed,
    Object my_name = freezed,
  }) {
    return _then(_value.copyWith(
      their_id: their_id == freezed ? _value.their_id : their_id as String,
      my_name: my_name == freezed ? _value.my_name : my_name as String,
    ));
  }
}

/// @nodoc
abstract class _$AcceptInviteMessageCopyWith<$Res>
    implements $AcceptInviteMessageCopyWith<$Res> {
  factory _$AcceptInviteMessageCopyWith(_AcceptInviteMessage value,
          $Res Function(_AcceptInviteMessage) then) =
      __$AcceptInviteMessageCopyWithImpl<$Res>;
  @override
  $Res call({String their_id, String my_name});
}

/// @nodoc
class __$AcceptInviteMessageCopyWithImpl<$Res>
    extends _$AcceptInviteMessageCopyWithImpl<$Res>
    implements _$AcceptInviteMessageCopyWith<$Res> {
  __$AcceptInviteMessageCopyWithImpl(
      _AcceptInviteMessage _value, $Res Function(_AcceptInviteMessage) _then)
      : super(_value, (v) => _then(v as _AcceptInviteMessage));

  @override
  _AcceptInviteMessage get _value => super._value as _AcceptInviteMessage;

  @override
  $Res call({
    Object their_id = freezed,
    Object my_name = freezed,
  }) {
    return _then(_AcceptInviteMessage(
      their_id: their_id == freezed ? _value.their_id : their_id as String,
      my_name: my_name == freezed ? _value.my_name : my_name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AcceptInviteMessage implements _AcceptInviteMessage {
  const _$_AcceptInviteMessage({this.their_id, this.my_name});

  factory _$_AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AcceptInviteMessageFromJson(json);

  @override
  final String their_id;
  @override
  final String my_name;

  @override
  String toString() {
    return 'AcceptInviteMessage(their_id: $their_id, my_name: $my_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AcceptInviteMessage &&
            (identical(other.their_id, their_id) ||
                const DeepCollectionEquality()
                    .equals(other.their_id, their_id)) &&
            (identical(other.my_name, my_name) ||
                const DeepCollectionEquality().equals(other.my_name, my_name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(their_id) ^
      const DeepCollectionEquality().hash(my_name);

  @JsonKey(ignore: true)
  @override
  _$AcceptInviteMessageCopyWith<_AcceptInviteMessage> get copyWith =>
      __$AcceptInviteMessageCopyWithImpl<_AcceptInviteMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AcceptInviteMessageToJson(this);
  }
}

abstract class _AcceptInviteMessage implements AcceptInviteMessage {
  const factory _AcceptInviteMessage({String their_id, String my_name}) =
      _$_AcceptInviteMessage;

  factory _AcceptInviteMessage.fromJson(Map<String, dynamic> json) =
      _$_AcceptInviteMessage.fromJson;

  @override
  String get their_id;
  @override
  String get my_name;
  @override
  @JsonKey(ignore: true)
  _$AcceptInviteMessageCopyWith<_AcceptInviteMessage> get copyWith;
}
