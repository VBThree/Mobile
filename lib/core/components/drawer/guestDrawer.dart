import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/splashScreen/view/splash_screen_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

typedef LocaleValue = Locale Function(Locale);

class GuestDrawer extends StatefulWidget {
  final Function onTap;

  GuestDrawer({this.onTap});

  @override
  _GuestDrawerState createState() => _GuestDrawerState();
}

class _GuestDrawerState extends State<GuestDrawer> {
  toggleButton() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final tr = LanguageManager.instance.trLocale;
      final en = LanguageManager.instance.enLocale;
      EasyLocalization.of(context).locale = context.locale == tr ? en : tr;
    });
  }

  toggleButton2() {}

  @override
  Widget build(BuildContext context) {
    bool toggleValue2 = false;
    bool toggleValue = false;

    var container2 = Container(
      child: buildAnimatedContainerButton_language(toggleValue2),
    );

    var container = Container(
      child: buildAnimatedContainerButton_mode(toggleValue),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: buildDrawer(context, container2, container),
    );
  }

  Drawer buildDrawer(
      BuildContext context, Container container2, Container container) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildDrawerHeader(),
          buildListTile_1(context),
          buildRegisterTile(context),
          buildListTile_2(context),
          buildListTile_3(container2, context),
        ],
      ),
    );
  }

  ListTile buildListTile_3(Container container2, BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language),
      trailing: container2,
      title: Text(LocaleKeys.NavBar_Languages.locale),
      onTap: () => widget.onTap(context, 0),
    );
  }

  ListTile buildListTile_2(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.map),
      title: Text(LocaleKeys.NavBar_Announcements.locale),
      onTap: () => {Navigator.pushNamedAndRemoveUntil(context, "/",(e) => false)},
    );
  }

  ListTile buildListTile_1(BuildContext context) {
    return ListTile(
      leading: Icon(Octicons.sign_in),
      title: Text(LocaleKeys.signIn.locale),
      onTap: () => {
        Navigator.pushNamedAndRemoveUntil(context, loginRoute,(e) => false),
      },
    );
  }

  ListTile buildRegisterTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text(LocaleKeys.signUp.locale),
      onTap: () => {
        Navigator.pushNamedAndRemoveUntil(context, register,(e) => false),
      },
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(6),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: buildCircleAvatar(),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            LocaleKeys.GuestDrawer_guestName.locale,
            style: TextStyle(
                fontSize: dynamicWidth(0.5),
                fontWeight: FontWeight.w600,
                color: Colors.black),
          )
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatar() {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          "https://w0.pngwave.com/png/873/489/avatar-youtube-cat-cute-dog-png-clip-art.png"),
    );
  }

  AnimatedContainer buildAnimatedContainerButton_mode(bool toggleValue) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: 25.0,
      width: 55.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: toggleValue
              ? Colors.blueGrey[100]
              : Colors.blueGrey[600].withOpacity(0.5)),
      child: Stack(children: <Widget>[
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          top: 3.0,
          left: toggleValue ? 30.0 : 0.0,
          right: toggleValue ? 0.0 : 30.0,
          child: InkWell(
            onTap: toggleButton2(),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(child: child, turns: animation);
              },
              child: toggleValue
                  ? Icon(Icons.brightness_5,
                      color: Colors.indigoAccent[50],
                      size: 18.0,
                      key: UniqueKey())
                  : Icon(Icons.brightness_2,
                      color: Colors.black, size: 18.0, key: UniqueKey()),
            ),
          ),
        )
      ]),
    );
  }

  AnimatedContainer buildAnimatedContainerButton_language(bool toggleValue2) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: 25.0,
      width: 55.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: toggleValue2 ? Colors.red[800] : Colors.blue.withOpacity(0.5)),
      child: Stack(children: <Widget>[
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          top: 3.0,
          left: toggleValue2 ? 30.0 : 0.0,
          right: toggleValue2 ? 0.0 : 30.0,
          child: InkWell(
            onTap: toggleButton,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(child: child, turns: animation);
              },
              child: toggleValue2
                  ? Icon(Icons.flag,
                      color: Colors.indigoAccent[50],
                      size: 18.0,
                      key: UniqueKey())
                  : Icon(Icons.flag,
                      color: Colors.black, size: 18.0, key: UniqueKey()),
            ),
          ),
        )
      ]),
    );
  }

  dynamicWidth(double d) {}
}
