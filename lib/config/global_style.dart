/*
this is global style
This file is used to styling a whole application
 */

import 'package:flutter/material.dart';
import 'package:sample/config/constants.dart';

class GlobalStyle {
  static const TextStyle titleStyle =
      TextStyle(color: primaryColor, fontWeight: FontWeight.w700, fontSize: 30);
  static const TextStyle logoStyle =
      TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 30);
  static const TextStyle h2Style =
      TextStyle(color: primaryColor, fontWeight: FontWeight.w600, fontSize: 20);

  static const TextStyle normalStyle =
      TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w300);

  static const TextStyle blueStyle =
      TextStyle(color: primaryBlue, fontSize: 14, fontWeight: FontWeight.w400);
  static const TextStyle underlineStyle = TextStyle(
      color: primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);

  static const TextStyle subTextStyle =
      TextStyle(color: primaryColor, fontSize: 12, fontWeight: FontWeight.w300);
  static const TextStyle bottomNavStyle =
      TextStyle(color: white, fontSize: 11, fontWeight: FontWeight.w300);

  static const TextStyle interestTitleStyle =
      TextStyle(color: primaryColor, fontSize: 12, fontWeight: FontWeight.w500);

  static const TextStyle boldStyle =
      TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle boldStyleDim = const TextStyle(
      color: Color.fromARGB(255, 192, 191, 191),
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static const TextStyle subTitleStyle =
      TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle subTitleStyleWhite =
      TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w300);
  static const TextStyle uploadStyle =
      TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500);

  static const TextStyle lightButtonStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: primaryColor);
  static const TextStyle darkButtonStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: white);
  static const TextStyle smallLightButtonStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor);
}
