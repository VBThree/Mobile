import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/base/view/base_view.dart';
import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/notifiers/theme_notifier.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
//This page is created to test some features

class WrongRouteView extends StatefulWidget {
  WrongRouteView({Key key}) : super(key: key);

  @override
  _WrongRouteViewState createState() => _WrongRouteViewState();
}

class _WrongRouteViewState extends BaseState<WrongRouteView> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: Text(LocaleKeys.routeFailed.locale),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(LocaleKeys.routeFailed.locale),
      actions: [
        IconButton(
            icon: Icon(Icons.cached),
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .changeTheme();
            }),
        IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final tr = LanguageManager.instance.trLocale;
              final en = LanguageManager.instance.enLocale;
              context.locale = context.locale == tr ? en : tr;
            })
      ],
    );
  }
}
