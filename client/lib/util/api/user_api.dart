import 'dart:convert';

import 'package:crypton/crypton.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stealth_chat/util/api/api.dart';

part 'user_api.freezed.dart';
part 'user_api.g.dart';

class UserApi {
  static Future<ShowUserResponse> show(String id) async {
    final response = await Api.get('user/$id');
    if (!Api.isSuccess(response.statusCode)) {
      throw response.body;
    }
    return ShowUserResponse.fromJson(jsonDecode(response.body));
  }

  static Future<void> create(
      String id, RSAPublicKey publicKey, String fcmToken) async {
    final response = await Api.post(
      'user',
      body: {
        'id': id,
        'publicKey': publicKey.toPEM(),
        'fcmToken': fcmToken,
      },
    );
    if (!Api.isSuccess(response.statusCode)) {
      throw response.body;
    }
  }

  static Future<void> delete(String userId) async {
    final response = await Api.delete('user/$userId');
    if (!Api.isSuccess(response.statusCode)) {
      throw response.body;
    }
  }
}

@freezed
abstract class ShowUserResponse with _$ShowUserResponse {
  const factory ShowUserResponse({String id, String publicKey}) =
      _ShowUserResponse;

  factory ShowUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowUserResponseFromJson(json);
}
