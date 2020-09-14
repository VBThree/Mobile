import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'light_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight _instance;

  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight.init();
    return _instance;
  }

  AppThemeLight.init();

  ThemeData get theme => lightTheme;
}
