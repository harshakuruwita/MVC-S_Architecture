import 'dart:convert';

import 'package:owwn_coding_challenge/common/constants.dart';
import 'package:owwn_coding_challenge/common/network/api_path.dart';
import 'package:owwn_coding_challenge/common/network/http_client.dart';
import 'package:owwn_coding_challenge/common/serializers/auth_serializer.dart';

class AuthService {
  Future<AuthResponseSerializer> requestToken({required String email}) async {
    Map<String, String> headers = {
      'X-API-KEY': apiKey,
    };

    final String uri = APIPathHelper.getValue(APIPath.auth);
    final body = jsonEncode(AuthRequestSerializer(email: email).toJson());

    final response = await HttpClient.instance.postRequst(uri, body, headers);
    AuthResponseSerializer authResponseSerializer =
        AuthResponseSerializer.fromJson(response);
    return authResponseSerializer;
  }
}
