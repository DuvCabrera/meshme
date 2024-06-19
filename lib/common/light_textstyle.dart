import 'package:flutter/material.dart';
import 'package:teste_mesh/common/app_textstyle.dart';

class LightTextstyle extends AppTextstyle {
  @override
  TextStyle get googleTextButton => _subtitleLargeLight;

  @override
  TextStyle get loginEnterButtonText => _subtitleLargeDark;

  @override
  TextStyle get appTextFieldSubtitleText => _subtitleLargeDark;

  @override
  TextStyle get appTextFieldErrorSubtitleText => _subtitleLargeError;

  @override
  TextStyle get appTextFieldHintText => _bodyMedium;

  @override
  TextStyle get appTextFieldInputText => _bodyMediumDark;

  @override
  TextStyle get lineWithTextText => _subtitleLightMedium;

  @override
  TextStyle get homeTitleText => _titleMedium;

  @override
  TextStyle get homeCardTitleText => _titleMedium;

  @override
  TextStyle get homeCardSubTitleText => _subtitleMedium;

  @override
  TextStyle get homeModalSubTitleText => _subtitleMedium;

  @override
  TextStyle get homeModalTitleText => _titleLarge;

  @override
  TextStyle get homeModalButtonText => _subtitleLargeWhite;

  @override
  TextStyle get eventAppBarTitleText => _titleMedium;
}

const String _fontFamily = 'Montserrat';

TextStyle _subtitleLargeDark = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _darkBlack);

TextStyle _subtitleLargeWhite = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _white);

TextStyle _subtitleLargeError = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _accentRed);

TextStyle _bodyMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _lightGray);

TextStyle _bodyMediumDark = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _midGray);

TextStyle _titleMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: _darkBlack);

TextStyle _titleLarge = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: _darkBlack);

TextStyle _subtitleMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _midGray);

TextStyle _subtitleLightMedium = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _lightGray);

TextStyle _subtitleLargeLight = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _lightGray);

const _darkBlack = Color.fromARGB(255, 49, 49, 49);
const _midGray = Color.fromARGB(255, 82, 82, 82);
const _lightGray = Color.fromARGB(255, 140, 140, 140);
const _accentRed = Colors.redAccent;
const _white = Colors.white;
