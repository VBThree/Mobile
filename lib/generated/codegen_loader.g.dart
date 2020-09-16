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

  static const Map<String,dynamic> tr = {
  "routeFailed": "Bir sorun oluştu!",
  "Achievements": "Başarılar",
  "Resolved": "Çözüldü",
  "Published": "Yayınlanan",
  "ChangePassword": "Parola Değiştir",
  "Logout": "Çıkış Yap"
};
static const Map<String,dynamic> en = {
  "routeFailed": "There is a problem!",
  "Achievements": "Achievements",
  "Resolved": "Resolved",
  "Published": "Published",
  "ChangePassword": "ChangePassword",
  "Logout": "Logout"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
