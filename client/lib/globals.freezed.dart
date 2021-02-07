// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'globals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DatabaseTearOff {
  const _$DatabaseTearOff();

// ignore: unused_element
  _Database call(
      AppDb app, ContactsDao contacts, NotificationsDao notifications) {
    return _Database(
      app,
      contacts,
      notifications,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Database = _$DatabaseTearOff();

/// @nodoc
mixin _$Database {
  AppDb get app;
  ContactsDao get contacts;
  NotificationsDao get notifications;

  @JsonKey(ignore: true)
  $DatabaseCopyWith<Database> get copyWith;
}

/// @nodoc
abstract class $DatabaseCopyWith<$Res> {
  factory $DatabaseCopyWith(Database value, $Res Function(Database) then) =
      _$DatabaseCopyWithImpl<$Res>;
  $Res call({AppDb app, ContactsDao contacts, NotificationsDao notifications});
}

/// @nodoc
class _$DatabaseCopyWithImpl<$Res> implements $DatabaseCopyWith<$Res> {
  _$DatabaseCopyWithImpl(this._value, this._then);

  final Database _value;
  // ignore: unused_field
  final $Res Function(Database) _then;

  @override
  $Res call({
    Object app = freezed,
    Object contacts = freezed,
    Object notifications = freezed,
  }) {
    return _then(_value.copyWith(
      app: app == freezed ? _value.app : app as AppDb,
      contacts: contacts == freezed ? _value.contacts : contacts as ContactsDao,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as NotificationsDao,
    ));
  }
}

/// @nodoc
abstract class _$DatabaseCopyWith<$Res> implements $DatabaseCopyWith<$Res> {
  factory _$DatabaseCopyWith(_Database value, $Res Function(_Database) then) =
      __$DatabaseCopyWithImpl<$Res>;
  @override
  $Res call({AppDb app, ContactsDao contacts, NotificationsDao notifications});
}

/// @nodoc
class __$DatabaseCopyWithImpl<$Res> extends _$DatabaseCopyWithImpl<$Res>
    implements _$DatabaseCopyWith<$Res> {
  __$DatabaseCopyWithImpl(_Database _value, $Res Function(_Database) _then)
      : super(_value, (v) => _then(v as _Database));

  @override
  _Database get _value => super._value as _Database;

  @override
  $Res call({
    Object app = freezed,
    Object contacts = freezed,
    Object notifications = freezed,
  }) {
    return _then(_Database(
      app == freezed ? _value.app : app as AppDb,
      contacts == freezed ? _value.contacts : contacts as ContactsDao,
      notifications == freezed
          ? _value.notifications
          : notifications as NotificationsDao,
    ));
  }
}

/// @nodoc
class _$_Database extends _Database {
  const _$_Database(this.app, this.contacts, this.notifications)
      : assert(app != null),
        assert(contacts != null),
        assert(notifications != null),
        super._();

  @override
  final AppDb app;
  @override
  final ContactsDao contacts;
  @override
  final NotificationsDao notifications;

  @override
  String toString() {
    return 'Database(app: $app, contacts: $contacts, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Database &&
            (identical(other.app, app) ||
                const DeepCollectionEquality().equals(other.app, app)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(app) ^
      const DeepCollectionEquality().hash(contacts) ^
      const DeepCollectionEquality().hash(notifications);

  @JsonKey(ignore: true)
  @override
  _$DatabaseCopyWith<_Database> get copyWith =>
      __$DatabaseCopyWithImpl<_Database>(this, _$identity);
}

abstract class _Database extends Database {
  const _Database._() : super._();
  const factory _Database(
          AppDb app, ContactsDao contacts, NotificationsDao notifications) =
      _$_Database;

  @override
  AppDb get app;
  @override
  ContactsDao get contacts;
  @override
  NotificationsDao get notifications;
  @override
  @JsonKey(ignore: true)
  _$DatabaseCopyWith<_Database> get copyWith;
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call({String id, String name, Keys keys}) {
    return _User(
      id: id,
      name: name,
      keys: keys,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id;
  String get name;
  Keys get keys;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String id, String name, Keys keys});

  $KeysCopyWith<$Res> get keys;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object keys = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      keys: keys == freezed ? _value.keys : keys as Keys,
    ));
  }

  @override
  $KeysCopyWith<$Res> get keys {
    if (_value.keys == null) {
      return null;
    }
    return $KeysCopyWith<$Res>(_value.keys, (value) {
      return _then(_value.copyWith(keys: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, Keys keys});

  @override
  $KeysCopyWith<$Res> get keys;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object keys = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      keys: keys == freezed ? _value.keys : keys as Keys,
    ));
  }
}

/// @nodoc
class _$_User implements _User {
  const _$_User({this.id, this.name, this.keys});

  @override
  final String id;
  @override
  final String name;
  @override
  final Keys keys;

  @override
  String toString() {
    return 'User(id: $id, name: $name, keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.keys, keys) ||
                const DeepCollectionEquality().equals(other.keys, keys)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(keys);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User({String id, String name, Keys keys}) = _$_User;

  @override
  String get id;
  @override
  String get name;
  @override
  Keys get keys;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
