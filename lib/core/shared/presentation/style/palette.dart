import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF560920);
  static const Color lightGrey = Color(0xFFe5e5e5);
  static const Color background = Color(0xFFe5e5e5);
  static const Color grey = Color(0xFFbbbdc2);
  static const Color darkGrey = Color(0xFF666666);
  static const Color blue = Color(0xFF2b6799);
  static const Color yellow = Color(0xFFD8C02D);
  static const Color lightBlue = Color(0xFF00b4e1);
  static const Color darkBlue = Color(0xFF173051);
  static const Color darkRed = Color(0xFF560920);

  static const Color black = Color(0xFF030307);
  static const Color white = Color(0xFFffffff);
  static const Color pink = Color(0xFFBA1A79);
  static const Color transparent = Color(0x00000000);

  static const List<Color> lineColors = [
    black,
    pink,
    pink,
    lightBlue,
    lightBlue,
    pink,
    pink,
    black,
  ];
  static MaterialColor primarySwatch = MaterialColor(
    primary.value,
    <int, Color>{
      50: primary.withOpacity(.1),
      100: primary.withOpacity(.2),
      200: primary.withOpacity(.3),
      300: primary.withOpacity(.4),
      400: primary.withOpacity(.5),
      500: primary.withOpacity(.6),
      600: primary.withOpacity(.7),
      700: primary.withOpacity(.8),
      800: primary.withOpacity(.9),
      900: primary.withOpacity(1),
    },
  );
}
