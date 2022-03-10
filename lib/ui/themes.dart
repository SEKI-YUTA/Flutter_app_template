import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishClr = Color.fromARGB(255, 54, 196, 252);
const Color darkGreyClr = Color(0xFF121212);
const primaryClr = bluishClr;

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryClr,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);
}

TextStyle get headingStyle {
  return TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get subHeadingStyle {
  return TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
}

TextStyle get normalStyle {
  return TextStyle(
    fontSize: 18,
  );
}
