import 'package:flutter/material.dart';

import 'package:owwn_coding_challenge/models/auth_model.dart';
import 'package:owwn_coding_challenge/models/user_list_model.dart';
import 'package:owwn_coding_challenge/services/auth_service.dart';
import 'package:owwn_coding_challenge/services/user_list_service.dart';
import 'package:provider/provider.dart';

late BuildContext _mainContext;

void init(BuildContext c) => _mainContext = c;

class BaseCommand {
  // Models
  AuthModel authModel = _mainContext.read();
  UserListModel userListModel = _mainContext.read();
  //Services
  AuthService authService = _mainContext.read();
  UserListService userListService = _mainContext.read();
}
