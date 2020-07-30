import 'package:flutter/material.dart';

import '../constants.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const BuildButton({
    Key key,
    this.text,
    this.press,
    this.color = hPrimrayColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: 60,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlatButton(
              color: color,
              onPressed: press,
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 20.0),
              ))),
    );
  }
}
