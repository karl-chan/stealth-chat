// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ShowUserResponse _$ShowUserResponseFromJson(Map<String, dynamic> json) {
  return _ShowUserResponse.fromJson(json);
}

/// @nodoc
class _$ShowUserResponseTearOff {
  const _$ShowUserResponseTearOff();

// ignore: unused_element
  _ShowUserResponse call({String id, String publicKey}) {
    return _ShowUserResponse(
      id: id,
      publicKey: publicKey,
    );
  }

// ignore: unused_element
  ShowUserResponse fromJson(Map<String, Object> json) {
    return ShowUserResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ShowUserResponse = _$ShowUserResponseTearOff();

/// @nodoc
mixin _$ShowUserResponse {
  String get id;
  String get publicKey;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ShowUserResponseCopyWith<ShowUserResponse> get copyWith;
}

/// @nodoc
abstract class $ShowUserResponseCopyWith<$Res> {
  factory $ShowUserResponseCopyWith(
          ShowUserResponse value, $Res Function(ShowUserResponse) then) =
      _$ShowUserResponseCopyWithImpl<$Res>;
  $Res call({String id, String publicKey});
}

/// @nodoc
class _$ShowUserResponseCopyWithImpl<$Res>
    implements $ShowUserResponseCopyWith<$Res> {
  _$ShowUserResponseCopyWithImpl(this._value, this._then);

  final ShowUserResponse _value;
  // ignore: unused_field
  final $Res Function(ShowUserResponse) _then;

  @override
  $Res call({
    Object id = freezed,
    Object publicKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      publicKey: publicKey == freezed ? _value.publicKey : publicKey as String,
    ));
  }
}

/// @nodoc
abstract class _$ShowUserResponseCopyWith<$Res>
    implements $ShowUserResponseCopyWith<$Res> {
  factory _$ShowUserResponseCopyWith(
          _ShowUserResponse value, $Res Function(_ShowUserResponse) then) =
      __$ShowUserResponseCopyWithImpl<$Res>;
  @override
  $Res call({String id, String publicKey});
}

/// @nodoc
class __$ShowUserResponseCopyWithImpl<$Res>
    extends _$ShowUserResponseCopyWithImpl<$Res>
    implements _$ShowUserResponseCopyWith<$Res> {
  __$ShowUserResponseCopyWithImpl(
      _ShowUserResponse _value, $Res Function(_ShowUserResponse) _then)
      : super(_value, (v) => _then(v as _ShowUserResponse));

  @override
  _ShowUserResponse get _value => super._value as _ShowUserResponse;

  @override
  $Res call({
    Object id = freezed,
    Object publicKey = freezed,
  }) {
    return _then(_ShowUserResponse(
      id: id == freezed ? _value.id : id as String,
      publicKey: publicKey == freezed ? _value.publicKey : publicKey as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ShowUserResponse implements _ShowUserResponse {
  const _$_ShowUserResponse({this.id, this.publicKey});

  factory _$_ShowUserResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ShowUserResponseFromJson(json);

  @override
  final String id;
  @override
  final String publicKey;

  @override
  String toString() {
    return 'ShowUserResponse(id: $id, publicKey: $publicKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowUserResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.publicKey, publicKey) ||
                const DeepCollectionEquality()
                    .equals(other.publicKey, publicKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(publicKey);

  @JsonKey(ignore: true)
  @override
  _$ShowUserResponseCopyWith<_ShowUserResponse> get copyWith =>
      __$ShowUserResponseCopyWithImpl<_ShowUserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShowUserResponseToJson(this);
  }
}

abstract class _ShowUserResponse implements ShowUserResponse {
  const factory _ShowUserResponse({String id, String publicKey}) =
      _$_ShowUserResponse;

  factory _ShowUserResponse.fromJson(Map<String, dynamic> json) =
      _$_ShowUserResponse.fromJson;

  @override
  String get id;
  @override
  String get publicKey;
  @override
  @JsonKey(ignore: true)
  _$ShowUserResponseCopyWith<_ShowUserResponse> get copyWith;
}
