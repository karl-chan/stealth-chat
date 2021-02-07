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
  _AcceptInviteMessage call({String theirId, String myName}) {
    return _AcceptInviteMessage(
      theirId: theirId,
      myName: myName,
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
  String get theirId;
  String get myName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AcceptInviteMessageCopyWith<AcceptInviteMessage> get copyWith;
}

/// @nodoc
abstract class $AcceptInviteMessageCopyWith<$Res> {
  factory $AcceptInviteMessageCopyWith(
          AcceptInviteMessage value, $Res Function(AcceptInviteMessage) then) =
      _$AcceptInviteMessageCopyWithImpl<$Res>;
  $Res call({String theirId, String myName});
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
    Object theirId = freezed,
    Object myName = freezed,
  }) {
    return _then(_value.copyWith(
      theirId: theirId == freezed ? _value.theirId : theirId as String,
      myName: myName == freezed ? _value.myName : myName as String,
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
  $Res call({String theirId, String myName});
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
    Object theirId = freezed,
    Object myName = freezed,
  }) {
    return _then(_AcceptInviteMessage(
      theirId: theirId == freezed ? _value.theirId : theirId as String,
      myName: myName == freezed ? _value.myName : myName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AcceptInviteMessage implements _AcceptInviteMessage {
  const _$_AcceptInviteMessage({this.theirId, this.myName});

  factory _$_AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AcceptInviteMessageFromJson(json);

  @override
  final String theirId;
  @override
  final String myName;

  @override
  String toString() {
    return 'AcceptInviteMessage(theirId: $theirId, myName: $myName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AcceptInviteMessage &&
            (identical(other.theirId, theirId) ||
                const DeepCollectionEquality()
                    .equals(other.theirId, theirId)) &&
            (identical(other.myName, myName) ||
                const DeepCollectionEquality().equals(other.myName, myName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(theirId) ^
      const DeepCollectionEquality().hash(myName);

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
  const factory _AcceptInviteMessage({String theirId, String myName}) =
      _$_AcceptInviteMessage;

  factory _AcceptInviteMessage.fromJson(Map<String, dynamic> json) =
      _$_AcceptInviteMessage.fromJson;

  @override
  String get theirId;
  @override
  String get myName;
  @override
  @JsonKey(ignore: true)
  _$AcceptInviteMessageCopyWith<_AcceptInviteMessage> get copyWith;
}
