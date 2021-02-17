import 'dart:convert';

import 'package:characters/characters.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ini/ini.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Properties {
  final Config _config;
  final SharedPreferences _prefs;

  static Future<Properties> init(SharedPreferences prefs) async {
    return rootBundle.loadStructuredData('assets/app.properties',
        (contents) async => Properties._(contents, prefs));
  }

  Properties._(String appProperties, SharedPreferences prefs)
      : _config = Config.fromString(appProperties),
        _prefs = prefs;

  String get(String path) {
    assert(path.contains('.'));

    String override = _getOverride(path);
    if (override != null) {
      return override;
    }

    final parts = List.from(
        path.characters.split('.'.characters, 2).map((chars) => chars.string));
    String section = parts[0];
    String option = parts[1];
    return _config.get(section, option);
  }

  String _getOverride(String path) {
    try {
      return _prefs.getString(path);
    } catch (ignored) {
      return null;
    }
  }

  List<String> getAsList(String path) {
    String contents = get(path);
    return (jsonDecode(contents) as List<dynamic>).cast<String>();
  }
}
