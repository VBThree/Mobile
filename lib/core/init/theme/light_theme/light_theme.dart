import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
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
