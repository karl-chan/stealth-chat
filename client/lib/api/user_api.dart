import 'package:crypton/crypton.dart';

import 'api.dart';

class UserApi {
  static Future<void> create(String id, RSAPublicKey publicKey) async {
    final response = await Api.post('user',
        body: {'id': id, 'publicKey': publicKey.toPEM()});
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
