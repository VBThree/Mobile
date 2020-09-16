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
  "signIn": "Sign In",
  "email": "E-mail",
  "password": "Password",
  "forgotPassword": "Forgot Password?",
  "dontHaveAnAccount": "Don't have an account?",
  "signUp": "Sign Up",
  "nameSurname": "Name Surname",
  "phoneNumber": "Phone number",
  "dateOfBirth": "Date of birth",
  "alreadySignedUp": "Already Signed Up?"
};
static const Map<String,dynamic> tr = {
  "routeFailed": "Bir sorun oluştu!",
  "signIn": "Giriş Yap",
  "email": "E-posta",
  "password": "Şifre",
  "forgotPassword": "Şifremi Unuttum",
  "dontHaveAnAccount": "Hesabın var mı?",
  "signUp": "Kayıt Ol",
  "nameSurname": "İsim Soyisim",
  "phoneNumber": "Telefon Numarası",
  "dateOfBirth": "Doğum Tarihi",
  "alreadySignedUp": "Zaten kayıtlı hesabın var mı?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
