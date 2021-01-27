// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'socket.dart';

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
  _AcceptInviteMessage call() {
    return const _AcceptInviteMessage();
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
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $AcceptInviteMessageCopyWith<$Res> {
  factory $AcceptInviteMessageCopyWith(
          AcceptInviteMessage value, $Res Function(AcceptInviteMessage) then) =
      _$AcceptInviteMessageCopyWithImpl<$Res>;
}

/// @nodoc
class _$AcceptInviteMessageCopyWithImpl<$Res>
    implements $AcceptInviteMessageCopyWith<$Res> {
  _$AcceptInviteMessageCopyWithImpl(this._value, this._then);

  final AcceptInviteMessage _value;
  // ignore: unused_field
  final $Res Function(AcceptInviteMessage) _then;
}

/// @nodoc
abstract class _$AcceptInviteMessageCopyWith<$Res> {
  factory _$AcceptInviteMessageCopyWith(_AcceptInviteMessage value,
          $Res Function(_AcceptInviteMessage) then) =
      __$AcceptInviteMessageCopyWithImpl<$Res>;
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
}

@JsonSerializable()

/// @nodoc
class _$_AcceptInviteMessage
    with DiagnosticableTreeMixin
    implements _AcceptInviteMessage {
  const _$_AcceptInviteMessage();

  factory _$_AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AcceptInviteMessageFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AcceptInviteMessage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AcceptInviteMessage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AcceptInviteMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AcceptInviteMessageToJson(this);
  }
}

abstract class _AcceptInviteMessage implements AcceptInviteMessage {
  const factory _AcceptInviteMessage() = _$_AcceptInviteMessage;

  factory _AcceptInviteMessage.fromJson(Map<String, dynamic> json) =
      _$_AcceptInviteMessage.fromJson;
}

AckLastMessageTimestampMessage _$AckLastMessageTimestampMessageFromJson(
    Map<String, dynamic> json) {
  return _AckLastMessageTimestampMessage.fromJson(json);
}

/// @nodoc
class _$AckLastMessageTimestampMessageTearOff {
  const _$AckLastMessageTimestampMessageTearOff();

// ignore: unused_element
  _AckLastMessageTimestampMessage call({int lastMessageTimestamp}) {
    return _AckLastMessageTimestampMessage(
      lastMessageTimestamp: lastMessageTimestamp,
    );
  }

// ignore: unused_element
  AckLastMessageTimestampMessage fromJson(Map<String, Object> json) {
    return AckLastMessageTimestampMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AckLastMessageTimestampMessage =
    _$AckLastMessageTimestampMessageTearOff();

/// @nodoc
mixin _$AckLastMessageTimestampMessage {
  int get lastMessageTimestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AckLastMessageTimestampMessageCopyWith<AckLastMessageTimestampMessage>
      get copyWith;
}

/// @nodoc
abstract class $AckLastMessageTimestampMessageCopyWith<$Res> {
  factory $AckLastMessageTimestampMessageCopyWith(
          AckLastMessageTimestampMessage value,
          $Res Function(AckLastMessageTimestampMessage) then) =
      _$AckLastMessageTimestampMessageCopyWithImpl<$Res>;
  $Res call({int lastMessageTimestamp});
}

/// @nodoc
class _$AckLastMessageTimestampMessageCopyWithImpl<$Res>
    implements $AckLastMessageTimestampMessageCopyWith<$Res> {
  _$AckLastMessageTimestampMessageCopyWithImpl(this._value, this._then);

  final AckLastMessageTimestampMessage _value;
  // ignore: unused_field
  final $Res Function(AckLastMessageTimestampMessage) _then;

  @override
  $Res call({
    Object lastMessageTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      lastMessageTimestamp: lastMessageTimestamp == freezed
          ? _value.lastMessageTimestamp
          : lastMessageTimestamp as int,
    ));
  }
}

/// @nodoc
abstract class _$AckLastMessageTimestampMessageCopyWith<$Res>
    implements $AckLastMessageTimestampMessageCopyWith<$Res> {
  factory _$AckLastMessageTimestampMessageCopyWith(
          _AckLastMessageTimestampMessage value,
          $Res Function(_AckLastMessageTimestampMessage) then) =
      __$AckLastMessageTimestampMessageCopyWithImpl<$Res>;
  @override
  $Res call({int lastMessageTimestamp});
}

/// @nodoc
class __$AckLastMessageTimestampMessageCopyWithImpl<$Res>
    extends _$AckLastMessageTimestampMessageCopyWithImpl<$Res>
    implements _$AckLastMessageTimestampMessageCopyWith<$Res> {
  __$AckLastMessageTimestampMessageCopyWithImpl(
      _AckLastMessageTimestampMessage _value,
      $Res Function(_AckLastMessageTimestampMessage) _then)
      : super(_value, (v) => _then(v as _AckLastMessageTimestampMessage));

  @override
  _AckLastMessageTimestampMessage get _value =>
      super._value as _AckLastMessageTimestampMessage;

  @override
  $Res call({
    Object lastMessageTimestamp = freezed,
  }) {
    return _then(_AckLastMessageTimestampMessage(
      lastMessageTimestamp: lastMessageTimestamp == freezed
          ? _value.lastMessageTimestamp
          : lastMessageTimestamp as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AckLastMessageTimestampMessage
    with DiagnosticableTreeMixin
    implements _AckLastMessageTimestampMessage {
  const _$_AckLastMessageTimestampMessage({this.lastMessageTimestamp});

  factory _$_AckLastMessageTimestampMessage.fromJson(
          Map<String, dynamic> json) =>
      _$_$_AckLastMessageTimestampMessageFromJson(json);

  @override
  final int lastMessageTimestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AckLastMessageTimestampMessage(lastMessageTimestamp: $lastMessageTimestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AckLastMessageTimestampMessage'))
      ..add(DiagnosticsProperty('lastMessageTimestamp', lastMessageTimestamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AckLastMessageTimestampMessage &&
            (identical(other.lastMessageTimestamp, lastMessageTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessageTimestamp, lastMessageTimestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastMessageTimestamp);

  @JsonKey(ignore: true)
  @override
  _$AckLastMessageTimestampMessageCopyWith<_AckLastMessageTimestampMessage>
      get copyWith => __$AckLastMessageTimestampMessageCopyWithImpl<
          _AckLastMessageTimestampMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AckLastMessageTimestampMessageToJson(this);
  }
}

abstract class _AckLastMessageTimestampMessage
    implements AckLastMessageTimestampMessage {
  const factory _AckLastMessageTimestampMessage({int lastMessageTimestamp}) =
      _$_AckLastMessageTimestampMessage;

  factory _AckLastMessageTimestampMessage.fromJson(Map<String, dynamic> json) =
      _$_AckLastMessageTimestampMessage.fromJson;

  @override
  int get lastMessageTimestamp;
  @override
  @JsonKey(ignore: true)
  _$AckLastMessageTimestampMessageCopyWith<_AckLastMessageTimestampMessage>
      get copyWith;
}

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
class _$_ErrorMessage with DiagnosticableTreeMixin implements _ErrorMessage {
  const _$_ErrorMessage({this.message});

  factory _$_ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ErrorMessageFromJson(json);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorMessage(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorMessage'))
      ..add(DiagnosticsProperty('message', message));
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

InviteAcceptedMessage _$InviteAcceptedMessageFromJson(
    Map<String, dynamic> json) {
  return _InviteAcceptedMessage.fromJson(json);
}

/// @nodoc
class _$InviteAcceptedMessageTearOff {
  const _$InviteAcceptedMessageTearOff();

// ignore: unused_element
  _InviteAcceptedMessage call() {
    return const _InviteAcceptedMessage();
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
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $InviteAcceptedMessageCopyWith<$Res> {
  factory $InviteAcceptedMessageCopyWith(InviteAcceptedMessage value,
          $Res Function(InviteAcceptedMessage) then) =
      _$InviteAcceptedMessageCopyWithImpl<$Res>;
}

/// @nodoc
class _$InviteAcceptedMessageCopyWithImpl<$Res>
    implements $InviteAcceptedMessageCopyWith<$Res> {
  _$InviteAcceptedMessageCopyWithImpl(this._value, this._then);

  final InviteAcceptedMessage _value;
  // ignore: unused_field
  final $Res Function(InviteAcceptedMessage) _then;
}

/// @nodoc
abstract class _$InviteAcceptedMessageCopyWith<$Res> {
  factory _$InviteAcceptedMessageCopyWith(_InviteAcceptedMessage value,
          $Res Function(_InviteAcceptedMessage) then) =
      __$InviteAcceptedMessageCopyWithImpl<$Res>;
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
}

@JsonSerializable()

/// @nodoc
class _$_InviteAcceptedMessage
    with DiagnosticableTreeMixin
    implements _InviteAcceptedMessage {
  const _$_InviteAcceptedMessage();

  factory _$_InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_InviteAcceptedMessageFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InviteAcceptedMessage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'InviteAcceptedMessage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InviteAcceptedMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InviteAcceptedMessageToJson(this);
  }
}

abstract class _InviteAcceptedMessage implements InviteAcceptedMessage {
  const factory _InviteAcceptedMessage() = _$_InviteAcceptedMessage;

  factory _InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =
      _$_InviteAcceptedMessage.fromJson;
}
