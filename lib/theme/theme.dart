import 'package:flutter/material.dart';

class Theme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark());
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light());
}
