import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/components/drawer/sideNaviBar.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/views/loginPage/viewModel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String artwork = "assets/images/profilePage/profilePageArtwork.svg";
String email = "";
String password = "";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  LoginViewModel viewModel = LoginViewModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyNavBar(),
        appBar: AppBar(),
        backgroundColor: Color.fromRGBO(131, 175, 175, 75),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Expanded(flex: 2, child: signInText()),
              Expanded(flex: 6, child: buildArtwork()),
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: emailAndPasswordTextField(),
              ),
              Spacer(flex: 1),
              Expanded(flex: 1, child: signInButton()),
              Expanded(flex: 1, child: forgotPasswordButton()),
              Spacer(flex: 6),
              Expanded(flex: 1, child: bottomAreaWidgets())
            ],
          ),
        ));
  }

  Column emailAndPasswordTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        emailTextField(),
        passwordTextField(),
      ],
    );
  }

  FlatButton forgotPasswordButton() => FlatButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, forgotPasswordRoute);
        },
        child: Text(LocaleKeys.ForgotPassword_forgotton_password_title.locale),
        textColor: Colors.blue[400],
      );

  Row signInButton() => Row(children: [
        Spacer(flex: 3),
        Expanded(
          flex: 14,
          child: RaisedButton(
            onPressed: () {
              viewModel.email = emailController.text;
              viewModel.password = passwordController.text;
              viewModel.signIn();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              LocaleKeys.signIn.locale,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.deepOrangeAccent[100],
          ),
        ),
        Spacer(flex: 3)
      ]);

  Row passwordTextField() => Row(children: [
        Spacer(flex: 3),
        Expanded(
          flex: 14,
          child: TextField(
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: LocaleKeys.authStrings_password.locale,
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            obscureText: true,
          ),
        ),
        Spacer(flex: 3)
      ]);

  Row emailTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
            flex: 14,
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: LocaleKeys.authStrings_email.locale,
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          Spacer(flex: 3),
        ],
      );

  SvgPicture buildArtwork() => SvgPicture.asset(artwork, fit: BoxFit.fill);

  Text signInText() => Text(LocaleKeys.signIn.locale,
      style: TextStyle(
          color: Color.fromRGBO(201, 87, 64, 1),
          fontWeight: FontWeight.bold,
          fontSize: dynamicHeight(0.03)));

  Row bottomAreaWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        askAccountText(),
        signUpButton(),
      ],
    );
  }

  FlatButton signUpButton() => FlatButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, "/registerPage");
        },
        child: Text(
          LocaleKeys.signUp.locale,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: Colors.transparent,
        textColor: Colors.black,
      );

  Text askAccountText() => Text(LocaleKeys.dontHaveAnAccount.locale);
}
