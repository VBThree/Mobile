import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/components/shadedButton.dart';
import 'package:VBThreeMobile/views/onboarding/onboardingPageData.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// TODO: Change Colors from Theme
// TODO: Change buttons text from localization
// TODO: Make Routing

class OnboardingPage extends StatefulWidget {
  final List<OnboardingData> onboardingDatas = [];
  @override
  State<StatefulWidget> createState() {
    return _OnboardingPage();
  }
}

class _OnboardingPage extends BaseState<OnboardingPage> {
  double currentSelectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: dynamicWidth(1),
              height: dynamicHeight(0.65),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: bodyWidget(
                    widget.onboardingDatas[currentSelectedTab.toInt()]),
              ),
            ),
            Container(child: Spacer(), height: 30),
            DotsIndicator(
              dotsCount: 4,
              position: currentSelectedTab,
            ),
            Container(child: Spacer(), height: 30),
            ShadedButton(
                currentSelectedTab == widget.onboardingDatas.length - 1
                    ? "Kayıt Ol"
                    : "Devam", () {
              setState(() {
                if (currentSelectedTab == 3) {
                  // TODO: routing
                } else {
                  currentSelectedTab += 1;
                }
              });
            }),
            AnimatedOpacity(
              opacity: currentSelectedTab == widget.onboardingDatas.length - 1
                  ? 1
                  : 0,
              duration: Duration(microseconds: 500),
              child: FlatButton(onPressed: null, child: Text("Giriş Yap")),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget bodyWidget(OnboardingData data) {
    return Column(children: [
      Container(
        height: 280,
        width: dynamicWidth(1),
        child: Lottie.asset(
          data.imagePath,
          width: dynamicWidth(0.7),
          fit: BoxFit.contain,
        ),
      ),
      Container(child: Spacer(), height: 30),
      Text(
        data.titleText,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.normal, color: Colors.red),
      ),
      Container(child: Spacer(), height: 30),
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Text(
          data.descriptionText,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
