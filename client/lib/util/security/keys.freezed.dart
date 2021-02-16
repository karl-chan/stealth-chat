// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'keys.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$KeysTearOff {
  const _$KeysTearOff();

// ignore: unused_element
  _Keys call(
      {String secretKey, RSAPublicKey publicKey, RSAPrivateKey privateKey}) {
    return _Keys(
      secretKey: secretKey,
      publicKey: publicKey,
      privateKey: privateKey,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Keys = _$KeysTearOff();

/// @nodoc
mixin _$Keys {
  String get secretKey;
  RSAPublicKey get publicKey;
  RSAPrivateKey get privateKey;

  @JsonKey(ignore: true)
  $KeysCopyWith<Keys> get copyWith;
}

/// @nodoc
abstract class $KeysCopyWith<$Res> {
  factory $KeysCopyWith(Keys value, $Res Function(Keys) then) =
      _$KeysCopyWithImpl<$Res>;
  $Res call(
      {String secretKey, RSAPublicKey publicKey, RSAPrivateKey privateKey});
}

/// @nodoc
class _$KeysCopyWithImpl<$Res> implements $KeysCopyWith<$Res> {
  _$KeysCopyWithImpl(this._value, this._then);

  final Keys _value;
  // ignore: unused_field
  final $Res Function(Keys) _then;

  @override
  $Res call({
    Object secretKey = freezed,
    Object publicKey = freezed,
    Object privateKey = freezed,
  }) {
    return _then(_value.copyWith(
      secretKey: secretKey == freezed ? _value.secretKey : secretKey as String,
      publicKey:
          publicKey == freezed ? _value.publicKey : publicKey as RSAPublicKey,
      privateKey: privateKey == freezed
          ? _value.privateKey
          : privateKey as RSAPrivateKey,
    ));
  }
}

/// @nodoc
abstract class _$KeysCopyWith<$Res> implements $KeysCopyWith<$Res> {
  factory _$KeysCopyWith(_Keys value, $Res Function(_Keys) then) =
      __$KeysCopyWithImpl<$Res>;
  @override
  $Res call(
      {String secretKey, RSAPublicKey publicKey, RSAPrivateKey privateKey});
}

/// @nodoc
class __$KeysCopyWithImpl<$Res> extends _$KeysCopyWithImpl<$Res>
    implements _$KeysCopyWith<$Res> {
  __$KeysCopyWithImpl(_Keys _value, $Res Function(_Keys) _then)
      : super(_value, (v) => _then(v as _Keys));

  @override
  _Keys get _value => super._value as _Keys;

  @override
  $Res call({
    Object secretKey = freezed,
    Object publicKey = freezed,
    Object privateKey = freezed,
  }) {
    return _then(_Keys(
      secretKey: secretKey == freezed ? _value.secretKey : secretKey as String,
      publicKey:
          publicKey == freezed ? _value.publicKey : publicKey as RSAPublicKey,
      privateKey: privateKey == freezed
          ? _value.privateKey
          : privateKey as RSAPrivateKey,
    ));
  }
}

/// @nodoc
class _$_Keys with DiagnosticableTreeMixin implements _Keys {
  const _$_Keys({this.secretKey, this.publicKey, this.privateKey});

  @override
  final String secretKey;
  @override
  final RSAPublicKey publicKey;
  @override
  final RSAPrivateKey privateKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Keys(secretKey: $secretKey, publicKey: $publicKey, privateKey: $privateKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Keys'))
      ..add(DiagnosticsProperty('secretKey', secretKey))
      ..add(DiagnosticsProperty('publicKey', publicKey))
      ..add(DiagnosticsProperty('privateKey', privateKey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Keys &&
            (identical(other.secretKey, secretKey) ||
                const DeepCollectionEquality()
                    .equals(other.secretKey, secretKey)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)) &&
            (identical(other.privateKey, privateKey) ||
                const DeepCollectionEquality()
                    .equals(other.privateKey, privateKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(secretKey) ^
      const DeepCollectionEquality().hash(publicKey) ^
      const DeepCollectionEquality().hash(privateKey);

  @JsonKey(ignore: true)
  @override
  _$KeysCopyWith<_Keys> get copyWith =>
      __$KeysCopyWithImpl<_Keys>(this, _$identity);
}

abstract class _Keys implements Keys {
  const factory _Keys(
      {String secretKey,
      RSAPublicKey publicKey,
      RSAPrivateKey privateKey}) = _$_Keys;

  @override
  String get secretKey;
  @override
  RSAPublicKey get publicKey;
  @override
  RSAPrivateKey get privateKey;
  @override
  @JsonKey(ignore: true)
  _$KeysCopyWith<_Keys> get copyWith;
}
