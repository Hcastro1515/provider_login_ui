import 'package:flutter/material.dart';

class BuildLogoCircle extends StatelessWidget {
  final double width;
  final double height;
  final Color containerColor, shadowColor;
  final Widget child;
  final double paddingAll;
  final Function press;
  final double radius;
  final double blurRdaius;
  const BuildLogoCircle({
    Key key,
    this.width,
    this.height,
    this.containerColor,
    this.shadowColor,
    this.child,
    this.paddingAll,
    this.press,
    this.radius,
    this.blurRdaius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingAll),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0, 5),
            blurRadius: blurRdaius,
          )
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(onTap: press, child: child),
    );
  }
}
