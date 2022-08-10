import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/commands/user_list_command.dart';
import 'package:owwn_coding_challenge/common/serializers/user_list_serializer.dart';
import 'package:owwn_coding_challenge/models/auth_model.dart';
import 'package:owwn_coding_challenge/models/user_list_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var users =
        context.select<UserListModel, List<Users>>((value) => value.userList);
    var token = context.select<AuthModel, String>((value) => value.accessToken);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Text(users[index].name);
                  })),
          ElevatedButton(
              onPressed: () {
                UserListCommand()
                    .runGetUserList(token: token, limit: '10', page: '1');
              },
              child: Text('dddd'))
        ],
      )),
    );
  }
}
