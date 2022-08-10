import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/common/serializers/user_list_serializer.dart';

class UserListModel extends ChangeNotifier {
  List<Users> _userList = [];
  List<Users> get userList => _userList;

  set userList(List<Users> list) {
    _userList = list;
    notifyListeners();
  }
}
