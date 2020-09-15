import 'package:VBThreeMobile/views/profile_page/profile.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profilePage:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => WrongRouteView(),
        );
    }
  }
}

const String homeRoute = '/';
const String profilePage = '/profilePage';
