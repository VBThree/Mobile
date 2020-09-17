import 'package:VBThreeMobile/views/mapPage/view/mapPageView.dart';
import 'package:VBThreeMobile/views/profile_page/profile.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_add_image_view.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_view.dart';
import 'package:VBThreeMobile/views/onboarding/onboardingPage.dart';
import 'package:VBThreeMobile/views/register/view/register.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
import 'package:VBThreeMobile/views/loginPage/view/loginPage.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profilePage:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );

      case onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingPage(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => MapPage(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case postAnnouncementPage:
        return MaterialPageRoute(
          builder: (_) => PostAnnouncementView(),
        );

      case postAnnouncementPageAddImageView:
        return MaterialPageRoute(
          builder: (_) => PostAnnouncementAddImageView(),
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
const String profilePage = '/profilePage';
const String postAnnouncementPage = '/postAnnouncementPage';
const String postAnnouncementPageAddImageView =
    '/postAnnouncementPageAddImageView';
const String onBoarding = '/onboarding';
