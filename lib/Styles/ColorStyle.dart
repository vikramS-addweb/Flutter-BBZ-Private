import 'package:flutter/material.dart';

class ColorStyle {
  static final Color scaffold = hex("#004383");

  static final Color primaryColor_1570A5 = hex("#1570A5");
  static final Color secondryColor = hex("#7432FF");

  static final Color black = hex("#000000");
  static final Color white = hex("#FFFFFF");
  static final Color grey_DAE1E7 = hex("#DAE1E7");
  static final Color grey_5E6D77 = hex("#5E6D77");
  static final Color grey_A8B0B5 = hex("#A8B0B5");
  static final Color red_ED0925 = hex("#ED0925");
  static final Color brown_C16D00 = hex("#C16D00");
  static final Color white_F3F3F3 = hex("#F3F3F3");
  static final Color lightBlue_F2F2F2 = hex("#F3F3F3");
  static final Color orange_C16D00 = hex("#C16D00");
  static final Color green_008428 = hex("#008428");
  static final Color white_FAFAFA = hex("#FAFAFA");


  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorConversion on Color {
  MaterialColor toMaterialColor() {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final r = red, g = green, b = blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
