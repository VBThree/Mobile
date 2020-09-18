import 'package:VBThreeMobile/core/init/theme/dark_theme/dark_theme.dart';
import 'package:VBThreeMobile/core/init/theme/light_theme/app_light_theme.dart';
import 'package:VBThreeMobile/core/init/theme/light_theme/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  void changeTheme() {
    if (_currentTheme == darkTheme) {
      _currentTheme = lightTheme;
    } else {
      _currentTheme = darkTheme;
    }
    notifyListeners();
  }
}
