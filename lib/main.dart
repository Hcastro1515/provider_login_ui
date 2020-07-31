import 'package:flutter/material.dart';
import 'package:flutter_redux_login/redux/app_state.dart';
import 'package:flutter_redux_login/redux/reducer.dart';
import 'package:flutter_redux_login/screens/sign_up_screen.dart';
import 'package:flutter_redux_login/screens/splash_screen.dart';

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(appReducer, initialState: AppState());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/loginScreen': (context) => LoginPage(),
          '/signUpScreen': (context) => SignUpPage()
        },
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"))),
      ),
    );
  }
}
