import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/commands/user_list_command.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  late String _accessToken;
  late String _refreshToken;

  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;

  AuthModel(this.prefs) {
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }

  set isLoggedIn(bool state) {
    _isLoggedIn = state;
    prefs.setBool('isLoggedIn', state);
    notifyListeners();
  }

  set accessToken(String token) {
    _accessToken = token;
    prefs.setString('accessToken', token);
  }

  set refreshToken(String token) {
    _refreshToken = token;
    prefs.setString('refreshToken', token);
  }

  void checkLoggedIn() {
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    accessToken = prefs.getString('accessToken') ?? '';
    refreshToken = prefs.getString('refreshToken') ?? '';

    // if (isLoggedIn) {
    //   UserListCommand()
    //       .runGetUserList(token: accessToken, limit: '10', page: '1');
    // }
  }
}
