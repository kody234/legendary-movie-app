import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewLayer extends ChangeNotifier {
  ThemeMode appThemeMode = ThemeMode.light;
  Color textColor = Color(0xFF12153D);
  Color containerColor = Colors.white;

  void themeSwitched() {
    if (appThemeMode == ThemeMode.light) {
      textColor = Colors.white;
      appThemeMode = ThemeMode.dark;
      containerColor = Colors.black38;
      print('theme mode is dark');
    } else if (appThemeMode == ThemeMode.dark) {
      appThemeMode = ThemeMode.light;
      textColor = Color(0xFF12153D);
      containerColor = Colors.white;
      print('theme mode is light');
    }

    notifyListeners();
  }
}
