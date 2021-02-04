import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stealth_chat/db/contacts.dart';
import 'package:stealth_chat/db/db.dart';
import 'package:stealth_chat/socket/socket.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/properties.dart';
import 'package:stealth_chat/util/security/keys.dart';

part 'globals.freezed.dart';

class Globals {
  // library variables
  SharedPreferences prefs;
  PackageInfo packageInfo;

  // auth status
  bool isLoggedIn = false;

  // database handles
  Database db;

  // socket handles
  Socket socket;

  // app variables
  Properties properties;
  User user;
  int lastMessageTimestamp;

  Future<Globals> init() async {
    prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();

    socket = Socket(this);

    socket = Socket(this);

    properties = await Properties.init();

    user = User(
        id: prefs.getString(Prefs.USER_ID),
        name: prefs.getString(Prefs.USER_NAME));
    lastMessageTimestamp = prefs.getInt(Prefs.LAST_MESSSAGE_TIMESTAMP);

    return this;
  }

  login(Keys keys) {
    user = user.copyWith(keys: keys);

    AppDb appDb = AppDb(this);
    db = Database(appDb, ContactsDao(appDb));

    socket = Socket(this)..connect();

    isLoggedIn = true;
  }

  Future<void> logout() async {
    logInfo('Logging out...');
    await prefs.setInt(Prefs.LAST_MESSSAGE_TIMESTAMP, lastMessageTimestamp);

    await socket.close();
    socket = null;

    await db.close();
    db = null;

    user = user.copyWith(keys: null);

    isLoggedIn = false;
  }
}

class Paths {
  static const ACCEPT_INVITE = '/accept-invite';
}

class Prefs {
  static const USER_ID = 'USER_ID';
  static const USER_NAME = 'USER_NAME';
  static const USER_PASSWORD_HASH = 'USER_PASSWORD_HASH';
  static const USER_PUBLIC_KEY = 'USER_PUBLIC_KEY';
  static const USER_PRIVATE_KEY_ENCRYPTED = 'USER_PRIVATE_KEY_ENCRYPTED';
  static const USER_PRIVATE_KEY_ENCRYPTED_IV = 'USER_PRIVATE_KEY_ENCRYPTED_IV';

  static const LAST_MESSSAGE_TIMESTAMP = 'LAST_MESSAGE_TIMESTAMP';
}

@freezed
abstract class Database implements _$Database {
  const Database._();
  const factory Database(AppDb app, ContactsDao contacts) = _Database;

  Future<void> close() async {
    logInfo('Closing database...');
    return app.close();
  }
}

@freezed
abstract class User with _$User {
  const factory User({String id, String name, Keys keys}) = _User;
}
