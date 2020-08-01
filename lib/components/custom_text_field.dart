import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool autoFocusValue;
  final bool obscureState;

  const CustomTextField({
    Key key,
    this.icon,
    this.hintText,
    this.autoFocusValue,
    this.obscureState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureState == true ? true : false,
      autofocus: autoFocusValue == true ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        icon: icon,
      ),
    );
  }
}
