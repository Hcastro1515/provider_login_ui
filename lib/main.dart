import 'package:flutter/material.dart';

import 'package:flutter_redux_login/screens/sign_up_screen.dart';
import 'package:flutter_redux_login/screens/splash_screen.dart';

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", 
      routes: {
        // '/': (context) => SplashScreen(),
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
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"))),
    );
  }
}
