import 'package:VBThreeMobile/core/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AllColors.PROFILE_DARK_GREY_BLUE),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: const BorderRadius.all(
        const Radius.circular(8.0),
      ),
    ),
  ),
);
