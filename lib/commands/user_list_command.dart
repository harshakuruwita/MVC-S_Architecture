import 'package:owwn_coding_challenge/common/serializers/auth_serializer.dart';
import 'package:owwn_coding_challenge/common/serializers/user_list_serializer.dart';
import 'package:owwn_coding_challenge/services/auth_service.dart';

import 'base_command.dart';

class UserListCommand extends BaseCommand {
  Future<List<Users>> runGetUserList({
    required String token,
    required String limit,
    required String page,
  }) async {
    final UserListSerializer userListSerializer =
        await userListService.getUserList(
      token: token,
      limit: limit,
      page: page,
    );

    if (userListSerializer.users.isNotEmpty)
      userListModel.userList = userListSerializer.users;

    return userListSerializer.users;
  }
}
