import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: LightColors().backGroundPageColor,
          child: Center(
            child: CircularProgressIndicator(
              color: LightColors().splashCircularProgressIndicatorColor,
            ),
          ),
        );
      },
    );
  }
}
