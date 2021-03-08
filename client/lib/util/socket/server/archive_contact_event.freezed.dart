// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'archive_contact_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ArchiveContactMessage _$ArchiveContactMessageFromJson(
    Map<String, dynamic> json) {
  return _ArchiveContactMessage.fromJson(json);
}

/// @nodoc
class _$ArchiveContactMessageTearOff {
  const _$ArchiveContactMessageTearOff();

// ignore: unused_element
  _ArchiveContactMessage call({String contactId}) {
    return _ArchiveContactMessage(
      contactId: contactId,
    );
  }

// ignore: unused_element
  ArchiveContactMessage fromJson(Map<String, Object> json) {
    return ArchiveContactMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ArchiveContactMessage = _$ArchiveContactMessageTearOff();

/// @nodoc
mixin _$ArchiveContactMessage {
  String get contactId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ArchiveContactMessageCopyWith<ArchiveContactMessage> get copyWith;
}

/// @nodoc
abstract class $ArchiveContactMessageCopyWith<$Res> {
  factory $ArchiveContactMessageCopyWith(ArchiveContactMessage value,
          $Res Function(ArchiveContactMessage) then) =
      _$ArchiveContactMessageCopyWithImpl<$Res>;
  $Res call({String contactId});
}

/// @nodoc
class _$ArchiveContactMessageCopyWithImpl<$Res>
    implements $ArchiveContactMessageCopyWith<$Res> {
  _$ArchiveContactMessageCopyWithImpl(this._value, this._then);

  final ArchiveContactMessage _value;
  // ignore: unused_field
  final $Res Function(ArchiveContactMessage) _then;

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
abstract class _$ArchiveContactMessageCopyWith<$Res>
    implements $ArchiveContactMessageCopyWith<$Res> {
  factory _$ArchiveContactMessageCopyWith(_ArchiveContactMessage value,
          $Res Function(_ArchiveContactMessage) then) =
      __$ArchiveContactMessageCopyWithImpl<$Res>;
  @override
  $Res call({String contactId});
}

/// @nodoc
class __$ArchiveContactMessageCopyWithImpl<$Res>
    extends _$ArchiveContactMessageCopyWithImpl<$Res>
    implements _$ArchiveContactMessageCopyWith<$Res> {
  __$ArchiveContactMessageCopyWithImpl(_ArchiveContactMessage _value,
      $Res Function(_ArchiveContactMessage) _then)
      : super(_value, (v) => _then(v as _ArchiveContactMessage));

  @override
  _ArchiveContactMessage get _value => super._value as _ArchiveContactMessage;

  @override
  $Res call({
    Object contactId = freezed,
  }) {
    return _then(_ArchiveContactMessage(
      contactId: contactId == freezed ? _value.contactId : contactId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ArchiveContactMessage implements _ArchiveContactMessage {
  const _$_ArchiveContactMessage({this.contactId});

  factory _$_ArchiveContactMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_ArchiveContactMessageFromJson(json);

  @override
  final String contactId;

  @override
  String toString() {
    return 'ArchiveContactMessage(contactId: $contactId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArchiveContactMessage &&
            (identical(other.contactId, contactId) ||
                const DeepCollectionEquality()
                    .equals(other.contactId, contactId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contactId);

  @JsonKey(ignore: true)
  @override
  _$ArchiveContactMessageCopyWith<_ArchiveContactMessage> get copyWith =>
      __$ArchiveContactMessageCopyWithImpl<_ArchiveContactMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArchiveContactMessageToJson(this);
  }
}

abstract class _ArchiveContactMessage implements ArchiveContactMessage {
  const factory _ArchiveContactMessage({String contactId}) =
      _$_ArchiveContactMessage;

  factory _ArchiveContactMessage.fromJson(Map<String, dynamic> json) =
      _$_ArchiveContactMessage.fromJson;

  @override
  String get contactId;
  @override
  @JsonKey(ignore: true)
  _$ArchiveContactMessageCopyWith<_ArchiveContactMessage> get copyWith;
}
