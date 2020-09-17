import 'package:VBThreeMobile/core/init/locale/locale_manager.dart';
import 'package:VBThreeMobile/views/splashScreen/viewmodel/splash_screen_viewmodel.dart';
import 'package:flutter/material.dart';

SplashScreenViewModel viewModel = SplashScreenViewModel();

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    viewModel.setToken();
    viewModel.checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("asd"),
      ),
    );
  }
}
