import 'package:VBThreeMobile/core/base/state/base_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(131, 175, 175, 75),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Expanded(flex: 1, child: signInText()),
              Expanded(flex: 5, child: buildArtwork()),
              Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    emailTextField(),
                    passwordTextField(),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Expanded(flex: 1, child: signInButton()),
              Expanded(flex: 1, child: forgotPasswordButton()),
              Spacer(flex: 2),
              Expanded(flex: 1, child: bottomAreaWidgets())
            ],
          ),
        ));
  }

  FlatButton forgotPasswordButton() => FlatButton(
        onPressed: () {},
        child: Text("Forgot Password?"),
        textColor: Colors.blue[400],
      );

  Row signInButton() => Row(children: [
        Spacer(flex: 3),
        Expanded(
          flex: 14,
          child: RaisedButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Sign In",
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
            onChanged: (inputPassword) {
              password = inputPassword;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Color.fromRGBO(245, 245, 245, 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(245, 245, 245, 1), width: 2),
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
              style: TextStyle(color: Color.fromRGBO(245, 245, 245, 1)),
              onChanged: (inputEmail) {
                email = inputEmail;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Color.fromRGBO(245, 245, 245, 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(245, 245, 245, 1), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          Spacer(flex: 3),
        ],
      );

  SvgPicture buildArtwork() => SvgPicture.asset(artwork, fit: BoxFit.fill);

  Text signInText() => Text("Sign In",
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
        onPressed: () {},
        child: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: Colors.transparent,
        textColor: Colors.black,
      );

  Text askAccountText() => Text("Don't have an account?");
}
