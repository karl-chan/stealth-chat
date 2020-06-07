import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stealth_chat/db/db.dart';
import 'package:stealth_chat/util/properties.dart';
import 'package:stealth_chat/util/security/keys.dart';

import 'db/contacts.dart';

part 'globals.freezed.dart';

class Globals {
  // library variables
  SharedPreferences prefs;
  PackageInfo packageInfo;

  // database handles
  Database db;

  // app variables
  Properties properties;
  User user;

  Future<Globals> init() async {
    prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();

    AppDb appDb = AppDb();
    db = Database(appDb, ContactsDao(appDb));

    properties = await Properties.init();

    user = User(
        id: prefs.getString(Prefs.USER_ID),
        name: prefs.getString(Prefs.USER_NAME));

    return this;
  }
}

class Prefs {
  static const USER_ID = 'USER_ID';
  static const USER_NAME = 'USER_NAME';
  static const USER_PASSWORD_HASH = 'USER_PASSWORD_HASH';
  static const USER_PUBLIC_KEY = 'USER_PUBLIC_KEY';
  static const USER_PRIVATE_KEY_ENCRYPTED = 'USER_PRIVATE_KEY_ENCRYPTED';
  static const USER_PRIVATE_KEY_ENCRYPTED_IV = 'USER_PRIVATE_KEY_ENCRYPTED_IV';
}

@freezed
abstract class Database with _$Database {
  const factory Database(AppDb app, ContactsDao contacts) = _Database;
}

@freezed
abstract class User with _$User {
  const factory User({String id, String name, Keys keys}) = _User;
}
