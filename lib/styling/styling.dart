import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static const h1 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const h2 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const placeholder = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const main = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const mainWhite = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textWhiteColor);

  static const errorMessege = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.red);
}

abstract class CustomColors {
  static const main = Color(0xFFF9F9F9);

  static const colorSheme = ColorScheme.light(background: main);

  static const textPrimaryColor = Color(0xFF211814);
  static const textWhiteColor = Colors.white;
  static const placeholder = Color(0xFFBFBFBF);
}
