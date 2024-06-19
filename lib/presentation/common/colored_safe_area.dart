// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';

class ColoredSafeArea extends StatelessWidget {
  const ColoredSafeArea({
    super.key,
    this.color,
    required this.child,
  });

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: (color == null) ? LightColors().safeAreaColor : color!,
      child: SafeArea(child: child),
    );
  }
}
