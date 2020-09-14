import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_constants.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: ApplicationConstants.LANGUAGE_ASSET_PATH,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
