// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ack_last_message_timestamp_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
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
    implements _AckLastMessageTimestampMessage {
  const _$_AckLastMessageTimestampMessage({this.lastMessageTimestamp});

  factory _$_AckLastMessageTimestampMessage.fromJson(
          Map<String, dynamic> json) =>
      _$_$_AckLastMessageTimestampMessageFromJson(json);

  @override
  final int lastMessageTimestamp;

  @override
  String toString() {
    return 'AckLastMessageTimestampMessage(lastMessageTimestamp: $lastMessageTimestamp)';
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
