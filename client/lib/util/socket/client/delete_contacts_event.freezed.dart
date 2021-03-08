// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'delete_contacts_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DeleteContactsMessage _$DeleteContactsMessageFromJson(
    Map<String, dynamic> json) {
  return _DeleteContactsMessage.fromJson(json);
}

/// @nodoc
class _$DeleteContactsMessageTearOff {
  const _$DeleteContactsMessageTearOff();

// ignore: unused_element
  _DeleteContactsMessage call({List<String> contactIds}) {
    return _DeleteContactsMessage(
      contactIds: contactIds,
    );
  }

// ignore: unused_element
  DeleteContactsMessage fromJson(Map<String, Object> json) {
    return DeleteContactsMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DeleteContactsMessage = _$DeleteContactsMessageTearOff();

/// @nodoc
mixin _$DeleteContactsMessage {
  List<String> get contactIds;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DeleteContactsMessageCopyWith<DeleteContactsMessage> get copyWith;
}

/// @nodoc
abstract class $DeleteContactsMessageCopyWith<$Res> {
  factory $DeleteContactsMessageCopyWith(DeleteContactsMessage value,
          $Res Function(DeleteContactsMessage) then) =
      _$DeleteContactsMessageCopyWithImpl<$Res>;
  $Res call({List<String> contactIds});
}

/// @nodoc
class _$DeleteContactsMessageCopyWithImpl<$Res>
    implements $DeleteContactsMessageCopyWith<$Res> {
  _$DeleteContactsMessageCopyWithImpl(this._value, this._then);

  final DeleteContactsMessage _value;
  // ignore: unused_field
  final $Res Function(DeleteContactsMessage) _then;

  @override
  $Res call({
    Object contactIds = freezed,
  }) {
    return _then(_value.copyWith(
      contactIds: contactIds == freezed
          ? _value.contactIds
          : contactIds as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$DeleteContactsMessageCopyWith<$Res>
    implements $DeleteContactsMessageCopyWith<$Res> {
  factory _$DeleteContactsMessageCopyWith(_DeleteContactsMessage value,
          $Res Function(_DeleteContactsMessage) then) =
      __$DeleteContactsMessageCopyWithImpl<$Res>;
  @override
  $Res call({List<String> contactIds});
}

/// @nodoc
class __$DeleteContactsMessageCopyWithImpl<$Res>
    extends _$DeleteContactsMessageCopyWithImpl<$Res>
    implements _$DeleteContactsMessageCopyWith<$Res> {
  __$DeleteContactsMessageCopyWithImpl(_DeleteContactsMessage _value,
      $Res Function(_DeleteContactsMessage) _then)
      : super(_value, (v) => _then(v as _DeleteContactsMessage));

  @override
  _DeleteContactsMessage get _value => super._value as _DeleteContactsMessage;

  @override
  $Res call({
    Object contactIds = freezed,
  }) {
    return _then(_DeleteContactsMessage(
      contactIds: contactIds == freezed
          ? _value.contactIds
          : contactIds as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DeleteContactsMessage implements _DeleteContactsMessage {
  const _$_DeleteContactsMessage({this.contactIds});

  factory _$_DeleteContactsMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_DeleteContactsMessageFromJson(json);

  @override
  final List<String> contactIds;

  @override
  String toString() {
    return 'DeleteContactsMessage(contactIds: $contactIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteContactsMessage &&
            (identical(other.contactIds, contactIds) ||
                const DeepCollectionEquality()
                    .equals(other.contactIds, contactIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(contactIds);

  @JsonKey(ignore: true)
  @override
  _$DeleteContactsMessageCopyWith<_DeleteContactsMessage> get copyWith =>
      __$DeleteContactsMessageCopyWithImpl<_DeleteContactsMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeleteContactsMessageToJson(this);
  }
}

abstract class _DeleteContactsMessage implements DeleteContactsMessage {
  const factory _DeleteContactsMessage({List<String> contactIds}) =
      _$_DeleteContactsMessage;

  factory _DeleteContactsMessage.fromJson(Map<String, dynamic> json) =
      _$_DeleteContactsMessage.fromJson;

  @override
  List<String> get contactIds;
  @override
  @JsonKey(ignore: true)
  _$DeleteContactsMessageCopyWith<_DeleteContactsMessage> get copyWith;
}
