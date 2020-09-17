// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "routeFailed": "There is a problem!",
  "NavBar": {
    "Profile": "Profile",
    "Announcements": "Announcements",
    "Languages": "Languages",
    "DarkMode": "Dark/Light Mode",
    "Logout": "Log out"
  },
  "ForgotPassword": {
    "forgotton_password_title": "Forgotten Password",
    "send_forgotPage": "Send",
    "email_forgotPage": "E-mail Address"
  },
  "signIn": "Sign In",
  "email": "E-mail",
  "password": "Password",
  "forgotPassword": "Forgot Password?",
  "dontHaveAnAccount": "Don't have an account?",
  "signUp": "Sign Up"
};
static const Map<String,dynamic> tr = {
  "routeFailed": "Bir sorun oluştu!",
  "NavBar": {
    "Profile": "Profil",
    "Announcements": "İlanlar",
    "Languages": "Diller",
    "DarkMode": "Karanlık/Açık tema",
    "Logout": "Çıkış",
    "signIn": "Giriş Yap",
    "email": "E-posta",
    "password": "Şifre",
    "forgotPassword": "Şifremi Unuttum",
    "dontHaveAnAccount": "Hesabın var mı?",
    "signUp": "Kayıt Ol"
  },
  "ForgotPassword": {
    "forgotton_password_title": "şifremi Unuttum",
    "email_forgotPage": "E-mail Adres",
    "send_forgotPage": "Gönder"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
