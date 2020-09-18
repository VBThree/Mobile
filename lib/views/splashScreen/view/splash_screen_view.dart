import 'dart:async';
import 'dart:collection';

import 'package:VBThreeMobile/core/init/locale/locale_manager.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:VBThreeMobile/views/splashScreen/viewmodel/splash_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

SplashScreenViewModel splashScreenViewModel = SplashScreenViewModel();

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    splashScreenViewModel.checkToken();
    Timer(Duration(seconds: 1), () {
      // 5s over, navigate to a new page
      Navigator.popAndPushNamed(context, mapRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie_assets/splashScreenAnimation.json"),
      ),
    );
  }
}
