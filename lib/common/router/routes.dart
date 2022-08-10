import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/common/constants.dart';
import 'package:owwn_coding_challenge/models/auth_model.dart';
import 'package:owwn_coding_challenge/views/error_page.dart';
import 'package:owwn_coding_challenge/views/home.dart';
import 'package:owwn_coding_challenge/views/login.dart';

class AppRouter {
  late AuthModel authModel;

  AppRouter(this.authModel);

  late final router = GoRouter(
    refreshListenable: authModel,
    debugLogDiagnostics: true,
    initialLocation: '/',
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: rootRouteName,
        path: '/',
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: loginRouteName,
        path: '/login',
        builder: (context, state) => Login(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),
    redirect: (state) {
      final loginLoc = state.namedLocation(loginRouteName);
      final isGoingToLogin = state.subloc == loginLoc;

      final loggedIn = authModel.isLoggedIn;
      final homeLoc = state.namedLocation(rootRouteName);

      if (!loggedIn && !isGoingToLogin) {
        return loginLoc;
      } else if (loggedIn && isGoingToLogin) {
        return homeLoc;
      } else {
        return null;
      }
    },
  );
}
