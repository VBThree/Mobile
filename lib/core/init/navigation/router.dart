import 'package:VBThreeMobile/views/profile_page/profile.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_add_image_view.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_view.dart';
import 'package:VBThreeMobile/views/onboarding/onboardingPage.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
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
const String profilePage = '/profilePage';
const String postAnnouncementPage = '/postAnnouncementPage';
const String postAnnouncementPageAddImageView =
    '/postAnnouncementPageAddImageView';
const String onBoarding = '/onboarding';
