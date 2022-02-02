import 'package:flutter/material.dart';
import 'package:movie_app/size_config.dart';

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

  TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 2.5 * SizeConfig.textMultiplier!),
    headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 4.7 * SizeConfig.textMultiplier!),
    headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 2.5 * SizeConfig.textMultiplier!),
    headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 3.5 * SizeConfig.textMultiplier!),
    headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 2.5 * SizeConfig.textMultiplier!),
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
