import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xffFF6F61);
  static const Color secColor = Color(0xffF4DECB);
  static const Color medColor = Color(0xffF4DECB);
  static const Color rareColor = Color(0xffE9F0FF);
  static const Color accentColor = Color(0xff98FF98);
  static const Color naturalColor = Color(0xff778899);
  static const Color grey = Color(0xFF393939);
  static const Color typographyColor = Color(0xff333333);
  static const Color highlightColor = Color(0xffFFEB3B);
  static const Color bgColor = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color errorColor = Color(0xffFF3B30);
  static const Color red = Color(0xffFF3B30);
  static const LinearGradient gradientColor = LinearGradient(
    colors: [
      Color(0xfffc9745), // Orange shade
      Color(0xfffd1d1d), // Red shade
      Color(0xffe44511), // Dark red shade
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
