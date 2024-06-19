import 'package:flutter/material.dart';
import 'package:teste_mesh/common/app_colors.dart';

class LightColors extends AppColors {
  @override
  Color get textFieldErrorColor => _accentRed;

  @override
  Color get textFieldFillColor => _white;

  @override
  Color get textFieldPassVisibilityColor => _lightGray;

  @override
  Color get safeAreaColor => _white;

  @override
  Color get dividerLineColor => _lightGray;

  @override
  Color get googleButtonBackGroundColor => _white;

  @override
  Color get googleButtonBorderColor => _lightGray;

  @override
  Color get googleButtonTextColor => _lightGray;

  @override
  Color get loginPageEnterButtonColor => _lightGreen;

  @override
  Color get appTextFieldBorderColor => _gray;

  @override
  Color get homePageAddButtonColor => _lightGreen;

  @override
  Color get homeDividerColor => _gray;

  @override
  Color get homeCardBorderColor => _gray;

  @override
  Color get homeModalButtonColor => _accentRed;

  @override
  Color get backGroundPageColor => _white;

  @override
  Color get eventConfirmButtonColor => _lightGreen;
}

const _white = Colors.white;
const _lightGreen = Color.fromARGB(255, 141, 228, 0);
const _lightGray = Color.fromARGB(255, 140, 140, 140);
const _accentRed = Colors.redAccent;
const _gray = Color.fromARGB(255, 230, 230, 230);
