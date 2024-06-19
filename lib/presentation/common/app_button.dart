// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:teste_mesh/common/light_textstyle.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.constraints,
    required this.text,
    this.onPressed,
    required this.color,
    this.isLogin = true,
  });

  final BoxConstraints constraints;
  final String text;
  final void Function()? onPressed;
  final Color color;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 48,
        width: constraints.maxWidth,
        child: Text(
          text,
          style: isLogin
              ? LightTextstyle().loginEnterButtonText
              : LightTextstyle().homeModalButtonText,
        ),
      ),
    );
  }
}
