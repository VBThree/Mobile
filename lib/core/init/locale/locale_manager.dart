import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static LocaleManager _localeManager;
  static SharedPreferences _preferences;

  static Future<LocaleManager> getInstance() async {
    if (_localeManager == null) {
      print("gir artık ");

      // keep local instance till it is fully initialized.
      var secureStorage = LocaleManager._();
      await secureStorage._init();
      _localeManager = secureStorage;
    }
    return _localeManager;
  }

  LocaleManager._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
    print(_preferences);
  }

  // get string
  static String getToken(String key, {String defValue = ''}) {
    if (_preferences == null) return "prefrences null";
    return _preferences.getString(key) ?? defValue;
  }

  // put string
  static Future<bool> putToken(String key, String token) {
    print(_preferences);
    if (_preferences == null) return null;
    return _preferences.setString(key, token);
  }
}
