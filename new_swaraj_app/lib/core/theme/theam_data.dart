import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme:  const ColorScheme.light(
    brightness: Brightness.light,
    surface: Colors.white,
    primary: Color(0xFF0078D7),
    secondary: Color(0xFF77c2fc),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: Color(0xFF202021),
    primary: Color(0xFF0059B2),
    secondary: Color(0xe292c5ff),
  ),
);