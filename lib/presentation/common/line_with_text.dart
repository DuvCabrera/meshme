import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';

class LineWithText extends StatelessWidget {
  final String text;

  const LineWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: LightColors().dividerLineColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text, style: LightTextstyle().lineWithTextText),
        ),
        Expanded(
          child: Divider(
            color: LightColors().dividerLineColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
