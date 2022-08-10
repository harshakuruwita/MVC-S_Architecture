import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/common/router/routes.dart';
import 'package:owwn_coding_challenge/models/auth_model.dart';
import 'package:owwn_coding_challenge/models/user_list_model.dart';
import 'package:owwn_coding_challenge/services/auth_service.dart';
import 'package:owwn_coding_challenge/services/user_list_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'commands/base_command.dart' as commands;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authModel = AuthModel(await SharedPreferences.getInstance());
  authModel.checkLoggedIn();
  runApp(MyApp(
    authModel: authModel,
  ));
}

class MyApp extends StatelessWidget {
  AuthModel authModel;
  MyApp({Key? key, required this.authModel}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => authModel),
        ChangeNotifierProvider(create: (c) => UserListModel()),
        Provider<AppRouter>(
          lazy: false,
          create: (c) => AppRouter(authModel),
        ),
        Provider(create: (c) => AuthService()),
        Provider(create: (c) => UserListService()),
      ],
      child: Builder(
        builder: (context) {
          final router = Provider.of<AppRouter>(context, listen: false).router;
          commands.init(context);
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
