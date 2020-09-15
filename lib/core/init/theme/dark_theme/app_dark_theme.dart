import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'dark_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark _instance;

  static AppThemeDark get instance {
    if (_instance == null) _instance = AppThemeDark.init();
    return _instance;
  }

  AppThemeDark.init();

  ThemeData get theme => darkTheme;
}
