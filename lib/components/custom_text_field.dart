import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool autoFocusValue;

  const CustomTextField({
    Key key,
    this.icon,
    this.hintText,
    this.autoFocusValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocusValue == true ? true : false,
      decoration: InputDecoration(hintText: hintText, icon: icon),
    );
  }
}
