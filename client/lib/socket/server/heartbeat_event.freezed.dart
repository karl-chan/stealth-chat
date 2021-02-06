// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'heartbeat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HeartbeatMessage _$HeartbeatMessageFromJson(Map<String, dynamic> json) {
  return _HeartbeatMessage.fromJson(json);
}

/// @nodoc
class _$HeartbeatMessageTearOff {
  const _$HeartbeatMessageTearOff();

// ignore: unused_element
  _HeartbeatMessage call({String message}) {
    return _HeartbeatMessage(
      message: message,
    );
  }

// ignore: unused_element
  HeartbeatMessage fromJson(Map<String, Object> json) {
    return HeartbeatMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HeartbeatMessage = _$HeartbeatMessageTearOff();

/// @nodoc
mixin _$HeartbeatMessage {
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HeartbeatMessageCopyWith<HeartbeatMessage> get copyWith;
}

/// @nodoc
abstract class $HeartbeatMessageCopyWith<$Res> {
  factory $HeartbeatMessageCopyWith(
          HeartbeatMessage value, $Res Function(HeartbeatMessage) then) =
      _$HeartbeatMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$HeartbeatMessageCopyWithImpl<$Res>
    implements $HeartbeatMessageCopyWith<$Res> {
  _$HeartbeatMessageCopyWithImpl(this._value, this._then);

  final HeartbeatMessage _value;
  // ignore: unused_field
  final $Res Function(HeartbeatMessage) _then;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$HeartbeatMessageCopyWith<$Res>
    implements $HeartbeatMessageCopyWith<$Res> {
  factory _$HeartbeatMessageCopyWith(
          _HeartbeatMessage value, $Res Function(_HeartbeatMessage) then) =
      __$HeartbeatMessageCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$HeartbeatMessageCopyWithImpl<$Res>
    extends _$HeartbeatMessageCopyWithImpl<$Res>
    implements _$HeartbeatMessageCopyWith<$Res> {
  __$HeartbeatMessageCopyWithImpl(
      _HeartbeatMessage _value, $Res Function(_HeartbeatMessage) _then)
      : super(_value, (v) => _then(v as _HeartbeatMessage));

  @override
  _HeartbeatMessage get _value => super._value as _HeartbeatMessage;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_HeartbeatMessage(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HeartbeatMessage implements _HeartbeatMessage {
  const _$_HeartbeatMessage({this.message});

  factory _$_HeartbeatMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_HeartbeatMessageFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'HeartbeatMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HeartbeatMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$HeartbeatMessageCopyWith<_HeartbeatMessage> get copyWith =>
      __$HeartbeatMessageCopyWithImpl<_HeartbeatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HeartbeatMessageToJson(this);
  }
}

abstract class _HeartbeatMessage implements HeartbeatMessage {
  const factory _HeartbeatMessage({String message}) = _$_HeartbeatMessage;

  factory _HeartbeatMessage.fromJson(Map<String, dynamic> json) =
      _$_HeartbeatMessage.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$HeartbeatMessageCopyWith<_HeartbeatMessage> get copyWith;
}
