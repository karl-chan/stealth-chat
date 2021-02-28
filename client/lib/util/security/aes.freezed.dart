// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'aes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AesMessage _$AesMessageFromJson(Map<String, dynamic> json) {
  return _AesMessage.fromJson(json);
}

/// @nodoc
class _$AesMessageTearOff {
  const _$AesMessageTearOff();

// ignore: unused_element
  _AesMessage call({String encrypted, String iv}) {
    return _AesMessage(
      encrypted: encrypted,
      iv: iv,
    );
  }

// ignore: unused_element
  AesMessage fromJson(Map<String, Object> json) {
    return AesMessage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AesMessage = _$AesMessageTearOff();

/// @nodoc
mixin _$AesMessage {
  String get encrypted;
  String get iv;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AesMessageCopyWith<AesMessage> get copyWith;
}

/// @nodoc
abstract class $AesMessageCopyWith<$Res> {
  factory $AesMessageCopyWith(
          AesMessage value, $Res Function(AesMessage) then) =
      _$AesMessageCopyWithImpl<$Res>;
  $Res call({String encrypted, String iv});
}

/// @nodoc
class _$AesMessageCopyWithImpl<$Res> implements $AesMessageCopyWith<$Res> {
  _$AesMessageCopyWithImpl(this._value, this._then);

  final AesMessage _value;
  // ignore: unused_field
  final $Res Function(AesMessage) _then;

  @override
  $Res call({
    Object encrypted = freezed,
    Object iv = freezed,
  }) {
    return _then(_value.copyWith(
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
    ));
  }
}

/// @nodoc
abstract class _$AesMessageCopyWith<$Res> implements $AesMessageCopyWith<$Res> {
  factory _$AesMessageCopyWith(
          _AesMessage value, $Res Function(_AesMessage) then) =
      __$AesMessageCopyWithImpl<$Res>;
  @override
  $Res call({String encrypted, String iv});
}

/// @nodoc
class __$AesMessageCopyWithImpl<$Res> extends _$AesMessageCopyWithImpl<$Res>
    implements _$AesMessageCopyWith<$Res> {
  __$AesMessageCopyWithImpl(
      _AesMessage _value, $Res Function(_AesMessage) _then)
      : super(_value, (v) => _then(v as _AesMessage));

  @override
  _AesMessage get _value => super._value as _AesMessage;

  @override
  $Res call({
    Object encrypted = freezed,
    Object iv = freezed,
  }) {
    return _then(_AesMessage(
      encrypted: encrypted == freezed ? _value.encrypted : encrypted as String,
      iv: iv == freezed ? _value.iv : iv as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AesMessage with DiagnosticableTreeMixin implements _AesMessage {
  const _$_AesMessage({this.encrypted, this.iv});

  factory _$_AesMessage.fromJson(Map<String, dynamic> json) =>
      _$_$_AesMessageFromJson(json);

  @override
  final String encrypted;
  @override
  final String iv;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AesMessage(encrypted: $encrypted, iv: $iv)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AesMessage'))
      ..add(DiagnosticsProperty('encrypted', encrypted))
      ..add(DiagnosticsProperty('iv', iv));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AesMessage &&
            (identical(other.encrypted, encrypted) ||
                const DeepCollectionEquality()
                    .equals(other.encrypted, encrypted)) &&
            (identical(other.iv, iv) ||
                const DeepCollectionEquality().equals(other.iv, iv)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(encrypted) ^
      const DeepCollectionEquality().hash(iv);

  @JsonKey(ignore: true)
  @override
  _$AesMessageCopyWith<_AesMessage> get copyWith =>
      __$AesMessageCopyWithImpl<_AesMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AesMessageToJson(this);
  }
}

abstract class _AesMessage implements AesMessage {
  const factory _AesMessage({String encrypted, String iv}) = _$_AesMessage;

  factory _AesMessage.fromJson(Map<String, dynamic> json) =
      _$_AesMessage.fromJson;

  @override
  String get encrypted;
  @override
  String get iv;
  @override
  @JsonKey(ignore: true)
  _$AesMessageCopyWith<_AesMessage> get copyWith;
}
