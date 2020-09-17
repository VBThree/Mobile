import 'package:VBThreeMobile/views/forgotPassword/forgotPassword.dart';
import 'package:VBThreeMobile/views/onboarding/onboardingPage.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
import 'package:VBThreeMobile/views/loginPage/loginPage.dart';
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

      case forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ForgotPassword(),
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
const String forgotPasswordRoute = '/forgotpassword';
