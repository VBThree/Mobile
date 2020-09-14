import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(LocaleKeys.routeFailed.locale),
            ),
          ),
        );
    }
  }
}

const String homeRoute = '/';
