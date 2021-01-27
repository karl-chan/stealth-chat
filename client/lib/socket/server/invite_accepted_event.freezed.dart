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
  _InviteAcceptedMessage call({String message}) {
    return _InviteAcceptedMessage(
      message: message,
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
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $InviteAcceptedMessageCopyWith<InviteAcceptedMessage> get copyWith;
}

/// @nodoc
abstract class $InviteAcceptedMessageCopyWith<$Res> {
  factory $InviteAcceptedMessageCopyWith(InviteAcceptedMessage value,
          $Res Function(InviteAcceptedMessage) then) =
      _$InviteAcceptedMessageCopyWithImpl<$Res>;
  $Res call({String message});
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
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
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
  $Res call({String message});
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
    Object message = freezed,
  }) {
    return _then(_InviteAcceptedMessage(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_InviteAcceptedMessage implements _InviteAcceptedMessage {
  const _$_InviteAcceptedMessage({this.message});

  factory _$_InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_InviteAcceptedMessageFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'InviteAcceptedMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InviteAcceptedMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

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
  const factory _InviteAcceptedMessage({String message}) =
      _$_InviteAcceptedMessage;

  factory _InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =
      _$_InviteAcceptedMessage.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$InviteAcceptedMessageCopyWith<_InviteAcceptedMessage> get copyWith;
}
