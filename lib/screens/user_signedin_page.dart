import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_login/services/user_repository.dart';
import 'package:provider/provider.dart';

class UserSignedInPage extends StatelessWidget {
  final FirebaseUser user;

  const UserSignedInPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: Text(user.email)),
        RaisedButton(onPressed: () => Provider.of<UserRepository>(context, listen: false).signOut(), child: Text("Sign out"))
      ],
    ));
  }
}
