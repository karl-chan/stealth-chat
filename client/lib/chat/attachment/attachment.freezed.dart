// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AttachmentTearOff {
  const _$AttachmentTearOff();

// ignore: unused_element
  _Attachment call({AttachmentType type, String name, Uint8List value}) {
    return _Attachment(
      type: type,
      name: name,
      value: value,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Attachment = _$AttachmentTearOff();

/// @nodoc
mixin _$Attachment {
  AttachmentType get type;
  String get name;
  Uint8List get value;

  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res>;
  $Res call({AttachmentType type, String name, Uint8List value});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res> implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  final Attachment _value;
  // ignore: unused_field
  final $Res Function(Attachment) _then;

  @override
  $Res call({
    Object type = freezed,
    Object name = freezed,
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as AttachmentType,
      name: name == freezed ? _value.name : name as String,
      value: value == freezed ? _value.value : value as Uint8List,
    ));
  }
}

/// @nodoc
abstract class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(
          _Attachment value, $Res Function(_Attachment) then) =
      __$AttachmentCopyWithImpl<$Res>;
  @override
  $Res call({AttachmentType type, String name, Uint8List value});
}

/// @nodoc
class __$AttachmentCopyWithImpl<$Res> extends _$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(
      _Attachment _value, $Res Function(_Attachment) _then)
      : super(_value, (v) => _then(v as _Attachment));

  @override
  _Attachment get _value => super._value as _Attachment;

  @override
  $Res call({
    Object type = freezed,
    Object name = freezed,
    Object value = freezed,
  }) {
    return _then(_Attachment(
      type: type == freezed ? _value.type : type as AttachmentType,
      name: name == freezed ? _value.name : name as String,
      value: value == freezed ? _value.value : value as Uint8List,
    ));
  }
}

/// @nodoc
class _$_Attachment extends _Attachment {
  const _$_Attachment({this.type, this.name, this.value}) : super._();

  @override
  final AttachmentType type;
  @override
  final String name;
  @override
  final Uint8List value;

  @override
  String toString() {
    return 'Attachment(type: $type, name: $name, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Attachment &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);
}

abstract class _Attachment extends Attachment {
  const _Attachment._() : super._();
  const factory _Attachment(
      {AttachmentType type, String name, Uint8List value}) = _$_Attachment;

  @override
  AttachmentType get type;
  @override
  String get name;
  @override
  Uint8List get value;
  @override
  @JsonKey(ignore: true)
  _$AttachmentCopyWith<_Attachment> get copyWith;
}
