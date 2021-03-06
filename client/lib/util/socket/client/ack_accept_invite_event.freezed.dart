// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ack_accept_invite_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AckAcceptInviteMessage _$AckAcceptInviteMessageFromJson(
    Map<String, dynamic> json) {
  return _AckAcceptInviteMessage.fromJson(json);
}

/// @nodoc
class _$AckAcceptInviteMessageTearOff {
  const _$AckAcceptInviteMessageTearOff();

// ignore: unused_element
  _AckAcceptInviteMessage call({String contactId}) {
    return _AckAcceptInviteMessage(
      contactId: contactId,
    );
  }

// ignore: unused_element
  AckAcceptInviteMessage fromJson(Map<String, Object> json) {
    return AckAcceptInviteMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AckAcceptInviteMessage = _$AckAcceptInviteMessageTearOff();

/// @nodoc
mixin _$AckAcceptInviteMessage {
  String get contactId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AckAcceptInviteMessageCopyWith<AckAcceptInviteMessage> get copyWith;
}

/// @nodoc
abstract class $AckAcceptInviteMessageCopyWith<$Res> {
  factory $AckAcceptInviteMessageCopyWith(AckAcceptInviteMessage value,
          $Res Function(AckAcceptInviteMessage) then) =
      _$AckAcceptInviteMessageCopyWithImpl<$Res>;
  $Res call({String contactId});
}

/// @nodoc
class _$AckAcceptInviteMessageCopyWithImpl<$Res>
    implements $AckAcceptInviteMessageCopyWith<$Res> {
  _$AckAcceptInviteMessageCopyWithImpl(this._value, this._then);

  final AckAcceptInviteMessage _value;
  // ignore: unused_field
  final $Res Function(AckAcceptInviteMessage) _then;

  @override
  $Res call({
    Object contactId = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
    ));
  }
}

/// @nodoc
abstract class _$AckAcceptInviteMessageCopyWith<$Res>
    implements $AckAcceptInviteMessageCopyWith<$Res> {
  factory _$AckAcceptInviteMessageCopyWith(_AckAcceptInviteMessage value,
          $Res Function(_AckAcceptInviteMessage) then) =
      __$AckAcceptInviteMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId});
}

/// @nodoc
class __$AckAcceptInviteMessageCopyWithImpl<$Res>
    extends _$AckAcceptInviteMessageCopyWithImpl<$Res>
    implements _$AckAcceptInviteMessageCopyWith<$Res> {
  __$AckAcceptInviteMessageCopyWithImpl(_AckAcceptInviteMessage _value,
      $Res Function(_AckAcceptInviteMessage) _then)
      : super(_value, (v) => _then(v as _AckAcceptInviteMessage));

  @override
  _AckAcceptInviteMessage get _value => super._value as _AckAcceptInviteMessage;

  @override
  $Res call({
    Object contactId = freezed,
  }) {
    return _then(_AckAcceptInviteMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AckAcceptInviteMessage implements _AckAcceptInviteMessage {
  const _$_AckAcceptInviteMessage({this.contactId});

  factory _$_AckAcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AckAcceptInviteMessageFromJson(json);

  @override
  final String contactId;

  @override
  String toString() {
    return 'AckAcceptInviteMessage(contactId: $contactId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AckAcceptInviteMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contactId);

  @JsonKey(ignore: true)
  @override
  _$AckAcceptInviteMessageCopyWith<_AckAcceptInviteMessage> get copyWith =>
      __$AckAcceptInviteMessageCopyWithImpl<_AckAcceptInviteMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AckAcceptInviteMessageToJson(this);
  }
}

abstract class _AckAcceptInviteMessage implements AckAcceptInviteMessage {
  const factory _AckAcceptInviteMessage({String contactId}) =
      _$_AckAcceptInviteMessage;

  factory _AckAcceptInviteMessage.fromJson(Map<String, dynamic> json) =
      _$_AckAcceptInviteMessage.fromJson;

  @override
  String get contactId;
  @override
  @JsonKey(ignore: true)
  _$AckAcceptInviteMessageCopyWith<_AckAcceptInviteMessage> get copyWith;
}
