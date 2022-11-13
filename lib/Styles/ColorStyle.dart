import 'package:flutter/material.dart';

class ColorStyle {
  static final Color scaffold = hex("#004383");

  static final Color primaryColor_1570A5 = hex("#1570A5");
  static final Color secondryColor = hex("#7432FF");

  static final Color black = hex("#000000");
  static final Color white = hex("#FFFFFF");
  static final Color grey_DAE1E7 = hex("#DAE1E7");
  static final Color grey_5E6D77 = hex("#5E6D77");

  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
