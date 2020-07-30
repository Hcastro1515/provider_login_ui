import 'package:flutter/material.dart';
import 'package:flutter_redux_login/components/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "../../constants.dart";

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome to EVALUA",
              style: Theme.of(context).textTheme.headline1),
          SvgPicture.asset(loginImage, height: size.height * 0.45),
          SizedBox(height: 20),
          BuildButton(press: () {}, text: "Login"),
          SizedBox(height: 10),
          BuildButton(press: () {}, text: "Sign up")
        ],
      ),
    );
  }
}
