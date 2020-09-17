import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';

typedef LocaleValue = Locale Function(Locale);

class MyNavBar extends StatefulWidget {
  final Function onTap;
  LocaleValue callback;

  MyNavBar(callback, {this.onTap});

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 25.0,
        width: 55.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color:
                toggleValue2 ? Colors.red[800] : Colors.blue.withOpacity(0.5)),
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
      ),
    );

    var container = Container(
      child: AnimatedContainer(
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
      ),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(6),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Başak Günay',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(LocaleKeys.NavBar_Profile.locale),
              onTap: () => {
                Navigator.pushNamed(context, "/profilePage"),
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text(LocaleKeys.NavBar_Announcements.locale),
              onTap: () => widget.onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.language),
              trailing: container2,
              title: Text(LocaleKeys.NavBar_Languages.locale),
              onTap: () => widget.onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.brightness_4),
              trailing: container,
              title: Text(LocaleKeys.NavBar_DarkMode.locale),
              onTap: () => widget.onTap(context, 0),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(LocaleKeys.NavBar_Logout.locale),
              onTap: () => widget.onTap(context, 0),
            ),
          ],
        ),
      ),
    );
  }
}
