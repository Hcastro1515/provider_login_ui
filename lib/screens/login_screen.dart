import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux_login/components/custom_text_field.dart';
import 'package:flutter_redux_login/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SvgPicture.asset(
                  loginImage,
                  height: size.height * .45,
                ),
                _customContainer(context, size),
              ]),
        ),
      ),
    );
  }
}

Widget _customContainer(BuildContext context, Size size) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Column(
        children: <Widget>[
          CustomTextField(
            hintText: "Email or Username",
            autoFocusValue: true,
            icon: Icon(
              Icons.email,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: "Password",
            autoFocusValue: true,
            icon: Icon(
              Icons.lock,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
        ],
      ),
    ),
    height: size.height * .35,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 20,
              offset: Offset(0, 10))
        ]),
  );
}
