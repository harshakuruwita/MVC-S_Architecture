import 'dart:convert';

import 'package:owwn_coding_challenge/common/constants.dart';
import 'package:owwn_coding_challenge/common/network/api_path.dart';
import 'package:owwn_coding_challenge/common/network/http_client.dart';
import 'package:owwn_coding_challenge/common/serializers/auth_serializer.dart';
import 'package:owwn_coding_challenge/common/serializers/user_list_serializer.dart';

class UserListService {
  Future<UserListSerializer> getUserList({
    required String token,
    required String limit,
    required String page,
  }) async {
    final Map<String, String> headers = {
      'X-API-KEY': apiKey,
      'Authorization': token,
    };

    final String uri =
        '${APIPathHelper.getValue(APIPath.userList)}?limit=$limit&page=$page';

    final response = await HttpClient.instance.getRequst(uri, headers);
    UserListSerializer userListSerializer =
        UserListSerializer.fromJson(response as Map<String, dynamic>);
    return userListSerializer;
  }
}
