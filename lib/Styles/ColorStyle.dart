import 'package:flutter/material.dart';

class ColorStyle {
  static final Color scaffold = hex("#004383");

  static final Color primaryColor = hex("#FFFFFF");
  static final Color secondryColor = hex("#7432FF");
  static final Color black = hex("#000000");
  static final Color grey = hex("#AEA4A4");
  static final Color greylow = hex("#666666");
  static final Color greylight = hex("D6D6D6");
  static final Color white = hex("#FFFFFF");
  static final Color yellow = hex("#CEA100");
  static final Color blue = hex("#F4F6FA");
  static final Color grays = hex("#BBB7C4");

  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
