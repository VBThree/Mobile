import 'package:VBThreeMobile/views/onboarding/onboardingPage.dart';
import 'package:VBThreeMobile/views/register/view/register.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
import 'package:VBThreeMobile/views/loginPage/view/loginPage.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingPage(),
        );
      case homeRoute:
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => WrongRouteView(),
        );
    }
  }
}

const String homeRoute = '/';
const String onboarding = '/onboarding';
const String loginRoute = '/loginPage';
const String register = '/registerPage';
