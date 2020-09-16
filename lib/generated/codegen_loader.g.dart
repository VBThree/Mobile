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
  "announcementTypes": {
    "Food": "Food",
    "Lost": "Lost",
    "Ownership": "Ownership",
    "Vaccination": "Vaccination"
  },
  "genders": {
    "maleHumanAndAnimal": "Male",
    "femaleAnimal": "Female",
    "femaleHuman": "Female"
  },
  "animalNames": {
    "Dog": "Dog",
    "Cat": "Cat",
    "Bird": "Bird",
    "Rabbit": "Rabbit"
  },
  "postAnnouncementPage": {
    "otherAnimals": "Other",
    "title": "Save The\nAnimals\nStart To Helping",
    "announcementTypeHint": "Announcement Type",
    "speciesHine": "Species",
    "breedHint": "Breed",
    "genderHint": "Gender",
    "descriptionHin": "Description"
  }
};
static const Map<String,dynamic> tr = {
  "routeFailed": "Bir sorun oluştu!",
  "announcementTypes": {
    "Food": "Besleme",
    "Lost": "Kayıp",
    "Ownership": "Sahiplenme",
    "Vaccination": "Aşılama"
  },
  "genders": {
    "maleHumanAndAnimal": "Erkek",
    "femaleAnimal": "Dişi",
    "femaleHuman": "Kadın"
  },
  "animalNames": {
    "Dog": "Köpek",
    "Cat": "Kedi",
    "Bird": "Kuş",
    "Rabbit": "Tavşan"
  },
  "postAnnouncementPage": {
    "otherAnimals": "Diğer",
    "title": "Dostların İçin\nBir İlan Yayınla",
    "announcementTypeHint": "İlan Konusu",
    "speciesHine": "Pet Türü",
    "breedHint": "Cinsi",
    "genderHint": "Cinsiyeti",
    "descriptionHin": "Açıklama"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
