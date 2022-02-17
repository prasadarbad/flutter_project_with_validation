import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _prefs;
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black26,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
