import 'package:flutter/material.dart';
import 'package:flutter_redux_login/components/custom_circle_button.dart';
import 'package:flutter_redux_login/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildThirdLoginParty extends StatelessWidget {
  Function pressGoogleSignIn;
  Function pressFacebookSignIn;

  BuildThirdLoginParty({
    Key key,
    this.pressFacebookSignIn,
    this.pressGoogleSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          press: () => print("Tapped"),
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
          press: pressGoogleSignIn,
          radius: 50,
          shadowColor: Colors.grey.withOpacity(.4),
        ),
      ],
    );
  }
}
