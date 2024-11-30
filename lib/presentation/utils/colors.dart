import 'package:flutter/material.dart';

class AppColors {
  static const Color scrim = Colors.black26;

  static const Color blue = Color(0xFF003D5B);

  static const Color green = Color(0xFF148A3C);
    static const Color darkRed = Color(0xFFCF0C2A);

  static const Color red = Color(0xFFEA0808);
      static const Color lightRed = Color(0xFFFFBDC7);

  static const Color yellow = Color(0xFFE1B726);
    static const Color lightYellow = Color(0xFFFFF4CE);

  static const Color redPossession = Color(0xFFCF0C2A);

  static const Color black2 = Color(0xFF1D1D1D);
  static const Color black3 = Color(0xFF282828);

  static const Color lightBlue = Color(0xFFFCFDFE);
  static const Color divider = Color(0xFFE0E0E0);

  static const Color backgroundColor = Color(0xFFF6F6FB);

  static const Color navBorderColor = Color(0x3C3C435C);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color inactive = Color(0xFFBDBDBD);

  static const Color chat_text_box_bg = Color(0xFFEFF1F3);

  static const Color dashboardOrange = Color(0xBFFF7500);

  static const Color scaffold_bg = Color(0xFFF7F7FC);

  static const Color label = Color(0xFF6E7191);
  static const Color outline = Color(0xFF828282);
  static const Color outline_btn = Color(0xFF263238);
  static const Color hint = Color(0xFFA0A3BD);
  static const Color input_bg = Color(0xFFEFF0F6);

  static const Color tab_bg = Color(0xFF002929);

  static const Color buttonText = Color(0xFF4E4B66);

  static const Color text = Color(0xFF292A2C);

  static const Color offset = Color(0x14323247);

  // static const MaterialColor primary = Color(0xFFE0371D);

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFe6f4f4),
      100: Color(0xFFcce9e9),
      200: Color(0xFF99d2d2),
      300: Color(0xFF66bcbc),
      400: Color(0xFF33a5a5),
      500: Color(_primaryValue),
      600: Color(0xFF007272),
      700: Color(0xFF006464),
      800: Color(0xFF003939),
      900: Color(0xFF001d1d),
    },
  );
  static const int _primaryValue = 0xFF008F8F;
}
