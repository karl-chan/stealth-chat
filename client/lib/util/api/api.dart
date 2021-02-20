import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class Api {
  static final host = Get.find<Globals>().properties.get('server.host');

  static Future<http.Response> get(String endpoint,
          {Map<String, String> headers = const {}}) =>
      http.get(_url(endpoint), headers: _sign(headers: headers));

  static Future<http.Response> post(String endpoint,
          {Map<String, String> headers = const {},
          dynamic body,
          Encoding encoding}) =>
      http.post(_url(endpoint),
          headers: _sign(headers: headers, body: body),
          body: body,
          encoding: encoding);

  static Future<http.Response> delete(String endpoint,
          {Map<String, String> headers = const {}}) =>
      http.delete(_url(endpoint), headers: _sign(headers: headers));

  static Uri _url(String endpoint) => Uri.parse('$host/api/$endpoint');

  static Map<String, String> _sign(
      {Map<String, String> headers, dynamic body = ''}) {
    Globals globals = Get.find();
    if (globals.user.id == null) {
      // no sign
      return headers;
    }

    String sigUser = globals.user.id;
    int sigTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    String msg = '$sigTimestamp|$body';
    String sigHash = Rsa.sign(msg, globals.user.keys);

    return {
      ...headers,
      'sig-user': sigUser,
      'sig-timestamp': sigTimestamp.toString(),
      'sig-hash': sigHash
    };
  }

  static bool isSuccess(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }
}
