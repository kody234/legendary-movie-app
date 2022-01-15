import 'package:flutter/material.dart';

class AppTheme {
  TextTheme lightTextTheme = const TextTheme(
    headline1: TextStyle(
        color: Color(0xFF12153D), fontWeight: FontWeight.w600, fontSize: 17),
    headline2: TextStyle(
        color: Color(0xFF12153D), fontWeight: FontWeight.w800, fontSize: 32),
    headline3: TextStyle(
        color: Color(0xFF737599), fontWeight: FontWeight.w600, fontSize: 17),
    headline4: TextStyle(
        color: Color(0xFF12153D), fontWeight: FontWeight.w500, fontSize: 24),
    headline5: TextStyle(
        color: Color(0xFF12153D), fontWeight: FontWeight.w800, fontSize: 17),
  );

  TextTheme darkTextTheme = const TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
    headline2: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w800, fontSize: 32),
    headline3: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
    headline4: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
    headline5: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),
  );

  ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: lightTextTheme,
    );
  }

  ThemeData dark() {
    return ThemeData(brightness: Brightness.dark, textTheme: darkTextTheme);
  }
}
