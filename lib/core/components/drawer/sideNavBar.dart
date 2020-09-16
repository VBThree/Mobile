import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(SideNavBar());

class SideNavBar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool toggleValue2 = false;
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    toggleButton() {
      setState(() {
        toggleValue = !toggleValue;
      });
    }

    toggleButton2() {
      setState(() {
        toggleValue2 = !toggleValue2;
      });
    }

    var container2 = Container(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 25.0,
        width: 55.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: toggleValue2
                ? Colors.red[800]
                : Colors.white54.withOpacity(0.5)),
        child: Stack(children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            top: 3.0,
            left: toggleValue2 ? 30.0 : 0.0,
            right: toggleValue2 ? 0.0 : 30.0,
            child: InkWell(
              onTap: toggleButton2,
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
            right: !toggleValue ? 0.0 : 30.0,
            child: InkWell(
              onTap: toggleButton,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0)),
        child: Drawer(
          child: Container(
            color: Colors.teal[50],
            child: ListView(children: <Widget>[
              Container(
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                    ),
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.all(0.0),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          radius: 50.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Text(
                            'Başak Günay',
                            style:
                                TextStyle(color: Colors.black, fontSize: 22.0),
                          ),
                        ),
                      )
                    ])),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(LocaleKeys.profilePage_Profile.locale),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.announcement),
                title: Text(LocaleKeys.profilePage_Announcements.locale),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.language),
                trailing: ClipRRect(child: container2),
                title: Text(LocaleKeys.profilePage_Languages.locale),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.brightness_4),
                trailing: ClipRRect(
                  child: container,
                ),
                title: Text(LocaleKeys.profilePage_DarkMode.locale),
                onTap: () => onTap(context, 0),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(LocaleKeys.profilePage_Logout.locale),
                onTap: () => onTap(context, 0),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  onTap(BuildContext context, int i) {}
}
