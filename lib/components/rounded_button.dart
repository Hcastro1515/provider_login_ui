import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool addShadow;

  const BuildButton({
    Key key,
    this.addShadow,
    this.text,
    this.press,
    this.color = hPrimrayColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          boxShadow: addShadow == true
              ? [
                  BoxShadow(
                      offset: Offset(0, 10),
                      color: Colors.grey.withOpacity(0.9),
                      blurRadius: 50)
                ]
              : null),
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
