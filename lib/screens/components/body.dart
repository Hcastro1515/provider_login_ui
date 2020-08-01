import 'package:flutter/material.dart';
import 'package:flutter_redux_login/components/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';

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
          SvgPicture.asset(signUpImage, height: size.height * 0.45),
          Text(
            "Login or Sign up to get started",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: size.height * .03),
          BuildButton(
            press: () => Navigator.pushNamed(context, "/loginScreen"),
            text: "Login",
            addShadow: false,
            height: 50,
          ),
          SizedBox(height: size.height * .025),
          BuildButton(
            press: () => Navigator.pushNamed(context, "/signUpScreen"),
            height: 50,
            text: "Sign up",
            addShadow: false,
          )
        ],
      ),
    );
  }
}
