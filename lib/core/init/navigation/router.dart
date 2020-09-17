import 'package:VBThreeMobile/views/forgotPassword/view/forgotPassword.dart';
import 'package:VBThreeMobile/views/loginPage/view/loginPage.dart';
import 'package:VBThreeMobile/views/onboarding/onboardingPage.dart';
import 'package:VBThreeMobile/views/splashScreen/view/splash_screen_view.dart';
import 'package:VBThreeMobile/views/wrong_route_page/wrong_route_page_view.dart';
import 'package:VBThreeMobile/views/mapPage/view/mapPageView.dart';
import 'package:VBThreeMobile/views/profile_page/view/profile.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_add_image_view.dart';
import 'package:VBThreeMobile/views/post_announcement_page/view/post_announcement_view.dart';
import 'package:VBThreeMobile/views/register/view/register.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreenView(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case profilePage:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );

      case onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingPage(),
        );
      case mapRoute:
        return MaterialPageRoute(
          builder: (_) => MapPage(),
        );

      case forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ForgotPassword(),
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

const String mapRoute = '/';
const String splashScreenRoute = '/splashScreen';
const String onboarding = '/onboarding';
const String loginRoute = '/loginPage';
const String forgotPasswordRoute = '/forgotpassword';
const String register = '/registerPage';
const String profilePage = '/profilePage';
const String postAnnouncementPage = '/postAnnouncementPage';
const String postAnnouncementPageAddImageView =
    '/postAnnouncementPageAddImageView';
const String onBoarding = '/onboarding';
