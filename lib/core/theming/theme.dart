

import 'package:flutter/material.dart';

class AppTheme {
  // Define light themes
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColorLight: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.grey[400]!,
      outline: Colors.blueGrey,
      outlineVariant: const Color(0xff3fa2fa),
    ),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0
    ),
  );


  // Define dark themes
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      outline: Colors.grey[800]!,
      outlineVariant: Colors.grey[600]!,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade900,
      elevation: 0.0
    ),
  );
}