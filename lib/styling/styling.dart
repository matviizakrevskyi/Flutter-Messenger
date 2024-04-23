import 'dart:math';

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

  static const h4 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const placeholder = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  // static const h5 = TextStyle(
  //     fontFamily: 'Raleway',
  //     fontSize: 18,
  //     fontWeight: FontWeight.w500,
  //     letterSpacing: 0,
  //     color: CustomColors.textPrimaryColor);

  static const main = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const main2 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const main3 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const textSecondary = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textPrimaryColor);

  static const textSecondary2 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.placeholder);

  static const textSecondary3 = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 12,
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

  static const errorButton = TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.red);
}

abstract class CustomColors {
  static const main = Color(0xFFF9F9F9);

  static const secondary = Color.fromARGB(255, 232, 232, 232);

  static const colorSheme = ColorScheme.light(background: main);

  static const textPrimaryColor = Color(0xFF211814);
  static const textWhiteColor = Colors.white;
  static const placeholder = Color(0xFFBFBFBF);

  static const defaoultAvatarColor = Color(0xFF98817B);

  static const avatarColors = [
    Color(0xFF7C0902),
    Color(0xFFFB607F),
    Color(0xFF00B9E8),
    Color(0xFF003262),
    Color(0xFF66FF00),
    Color(0xFF1B4D3E),
    Color(0xFF00FFFF),
    Color(0xFF98817B),
  ];

  static Color get randomAvatarColor {
    final random = Random();
    final randomIndex = random.nextInt(avatarColors.length);
    return avatarColors[randomIndex];
  }

  static int get randomAvatarColorValue {
    final random = Random();
    final randomIndex = random.nextInt(avatarColors.length);
    return avatarColors[randomIndex].value;
  }
}
