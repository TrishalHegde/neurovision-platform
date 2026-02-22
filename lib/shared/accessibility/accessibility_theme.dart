import 'package:flutter/material.dart';

class AccessibilityTheme {
  static ThemeData build({
    required double fontScale,
  }) {
    return ThemeData(
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16 * fontScale),
        bodyMedium: TextStyle(fontSize: 14 * fontScale),
        titleLarge: TextStyle(fontSize: 20 * fontScale),
      ),
    );
  }
}
