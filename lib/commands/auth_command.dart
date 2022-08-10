import 'package:owwn_coding_challenge/commands/user_list_command.dart';
import 'package:owwn_coding_challenge/common/serializers/auth_serializer.dart';
import 'package:owwn_coding_challenge/services/auth_service.dart';

import 'base_command.dart';

class AuthCommand extends BaseCommand {
  Future<AuthResponseSerializer> runRequestToken(String email) async {
    AuthResponseSerializer authResponseSerializer =
        await authService.requestToken(email: email);

    if (authResponseSerializer.errorType == null) authModel.isLoggedIn = true;
    authModel.accessToken = authResponseSerializer.accessToken.toString();
    authModel.refreshToken = authResponseSerializer.refreshToken.toString();
    UserListCommand()
        .runGetUserList(token: authModel.accessToken, limit: '10', page: '1');

    return authResponseSerializer;
  }
}
