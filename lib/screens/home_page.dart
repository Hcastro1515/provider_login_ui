import 'package:flutter/material.dart';
import 'package:flutter_redux_login/screens/login_screen.dart';
import 'package:flutter_redux_login/screens/splash_screen.dart';
import 'package:flutter_redux_login/screens/user_signedin_page.dart';
import 'package:flutter_redux_login/services/user_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserRepository.instance(),
      child: Consumer(
        builder: (context, UserRepository user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return SplashScreen();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginPage();
            case Status.Authenticated:
              return UserSignedInPage(user: user.user);
          }
        },
      ),
    );
  }
}