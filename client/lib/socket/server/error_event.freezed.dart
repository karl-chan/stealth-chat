// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'error_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) {
  return _ErrorMessage.fromJson(json);
}

/// @nodoc
class _$ErrorMessageTearOff {
  const _$ErrorMessageTearOff();

// ignore: unused_element
  _ErrorMessage call({String message}) {
    return _ErrorMessage(
      message: message,
    );
  }

// ignore: unused_element
  ErrorMessage fromJson(Map<String, Object> json) {
    return ErrorMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ErrorMessage = _$ErrorMessageTearOff();

/// @nodoc
mixin _$ErrorMessage {
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ErrorMessageCopyWith<ErrorMessage> get copyWith;
}

/// @nodoc
abstract class $ErrorMessageCopyWith<$Res> {
  factory $ErrorMessageCopyWith(
          ErrorMessage value, $Res Function(ErrorMessage) then) =
      _$ErrorMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorMessageCopyWithImpl<$Res> implements $ErrorMessageCopyWith<$Res> {
  _$ErrorMessageCopyWithImpl(this._value, this._then);

  final ErrorMessage _value;
  // ignore: unused_field
  final $Res Function(ErrorMessage) _then;

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
abstract class _$ErrorMessageCopyWith<$Res>
    implements $ErrorMessageCopyWith<$Res> {
  factory _$ErrorMessageCopyWith(
          _ErrorMessage value, $Res Function(_ErrorMessage) then) =
      __$ErrorMessageCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$ErrorMessageCopyWithImpl<$Res> extends _$ErrorMessageCopyWithImpl<$Res>
    implements _$ErrorMessageCopyWith<$Res> {
  __$ErrorMessageCopyWithImpl(
      _ErrorMessage _value, $Res Function(_ErrorMessage) _then)
      : super(_value, (v) => _then(v as _ErrorMessage));

  @override
  _ErrorMessage get _value => super._value as _ErrorMessage;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_ErrorMessage(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ErrorMessage implements _ErrorMessage {
  const _$_ErrorMessage({this.message});

  factory _$_ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorMessageFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'ErrorMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ErrorMessageCopyWith<_ErrorMessage> get copyWith =>
      __$ErrorMessageCopyWithImpl<_ErrorMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ErrorMessageToJson(this);
  }
}

abstract class _ErrorMessage implements ErrorMessage {
  const factory _ErrorMessage({String message}) = _$_ErrorMessage;

  factory _ErrorMessage.fromJson(Map<String, dynamic> json) =
      _$_ErrorMessage.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$ErrorMessageCopyWith<_ErrorMessage> get copyWith;
}
