import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool autoFocusValue;
  final bool obscureState;
  final TextEditingController controller;
  final String validatorString;
  const CustomTextField({
    Key key,
    this.icon,
    this.hintText,
    this.autoFocusValue,
    this.obscureState,
    this.controller,
    this.validatorString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => (value.isEmpty) ? validatorString : null,
      obscureText: obscureState == true ? true : false,
      autofocus: autoFocusValue == true ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        icon: icon,
      ),
    );
  }
}
