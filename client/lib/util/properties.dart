import 'dart:convert';

import 'package:characters/characters.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ini/ini.dart';

class Properties {
  final Config _config;

  static Future<Properties> init() async {
    return rootBundle.loadStructuredData(
        'assets/app.properties', (contents) async => Properties._(contents));
  }

  Properties._(String appProperties)
      : _config = Config.fromString(appProperties);

  String get(String path) {
    assert(path.contains("."));
    final parts = List.from(
        path.characters.split('.'.characters, 2).map((chars) => chars.string));
    String section = parts[0];
    String option = parts[1];
    return _config.get(section, option);
  }

  List<String> getAsList(String path) {
    String contents = get(path);
    return (jsonDecode(contents) as List<dynamic>).cast<String>();
  }
}
