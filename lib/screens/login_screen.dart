import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux_login/components/custom_circle_button.dart';
import 'package:flutter_redux_login/components/custom_text_field.dart';
import 'package:flutter_redux_login/components/rounded_button.dart';
import 'package:flutter_redux_login/services/user_repository.dart';
import 'package:flutter_redux_login/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<UserRepository>(context);
    return SafeArea(
      child: Scaffold(
          key: _key,
          body: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                      height: size.height * .30,
                    ),
                    Container(
                      height: size.height * .45,
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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(
                            children: <Widget>[
                              CustomTextField(
                                controller: _email,
                                validatorString: "Enter email address",
                                hintText: "Email or Username",
                                autoFocusValue: false,
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
                                validatorString: "Enter a valid password",
                                controller: _password,
                                hintText: "Password",
                                autoFocusValue: false,
                                obscureState: true,
                                icon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                ),
                              ),
                              _buildForgotPassword(),
                              SizedBox(height: size.height * .02),
                              _buildThirdLogingParty(),
                              user.status == Status.Authenticating
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: BuildButton(
                                        color: hPrimrayColor,
                                        height: 40,
                                        text: "Sign in",
                                        press: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            if (!await user.signIn(
                                                _email.text, _password.text))
                                              _key.currentState.showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          "Something is wrong")));
                                          }
                                        },
                                      ),
                                    )
                            ],
                          ))
                        ],
                      ),
                    ),

                    // _customContainer(context, size),
                  ]),
            ),
          )),
    );
  }
}

Widget _customContainer(BuildContext context, Size size) => Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _textFieldContainer(context),
            SizedBox(height: size.height * .02),
            _buildThirdLogingParty(),
            SizedBox(height: size.height * .02),
            _buttonContainer()
          ],
        ),
      ),
      height: size.height * .45,
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

Widget _buttonContainer() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: BuildButton(
      color: hPrimrayColor,
      height: 40,
      text: "Login",
      press: () => print("tapped"),
    ),
  );
}

Widget _textFieldContainer(BuildContext context) {
  return Container(
      child: Column(
    children: <Widget>[
      CustomTextField(
        hintText: "Email or Username",
        autoFocusValue: false,
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
        autoFocusValue: false,
        obscureState: true,
        icon: Icon(
          Icons.lock,
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
      ),
      _buildForgotPassword(),
    ],
  ));
}

Widget _buildForgotPassword() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          "Forgot password?",
          style: TextStyle(color: Colors.grey.withOpacity(.8)),
        )
      ],
    ),
  );
}

Widget _buildThirdLogingParty() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      BuildLogoCircle(
        width: 50,
        height: 50,
        child: SvgPicture.asset(facebooklogo),
        blurRdaius: 20,
        containerColor: Colors.white,
        paddingAll: 8,
        press: () => print("tapped"),
        radius: 50,
        shadowColor: Colors.grey.withOpacity(.4),
      ),
      SizedBox(width: 15),
      BuildLogoCircle(
        width: 50,
        height: 50,
        child: SvgPicture.asset(googlelogo),
        blurRdaius: 20,
        containerColor: Colors.white,
        paddingAll: 8,
        press: () => print("tapped"),
        radius: 50,
        shadowColor: Colors.grey.withOpacity(.4),
      ),
    ],
  );
}
