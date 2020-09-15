import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/init/notifiers/application_providers.dart';
import 'core/init/notifiers/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [...ApplicationProviders.instance.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANGUAGE_ASSET_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
