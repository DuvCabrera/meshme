import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton(
      {super.key, required this.onPressed, required this.screenSize});
  final void Function()? onPressed;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenSize.width, 48),
        backgroundColor: LightColors().googleButtonBackGroundColor,
        foregroundColor: LightColors().googleButtonTextColor,
        side: BorderSide(color: LightColors().googleButtonBorderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              'assets/images/google_logo.png',
              height: 24.0,
              width: 24.0,
            ),
          ),
          Container(
            width: screenSize.width - 164,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 13.5),
              child: Text('Continuar com o Google',
                  style: LightTextstyle().googleTextButton),
            ),
          ),
        ],
      ),
    );
  }
}
