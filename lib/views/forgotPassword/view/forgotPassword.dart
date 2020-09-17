import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/forgotPassword/viewmodel/forgot_password_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:flutter_svg/svg.dart';

const String artwork = "assets/images/forgotPassword/img1.svg";
var forgotPasswordPageViewModel = ForgotPasswordViewModel();

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(flex: 1, child: buildTitle()),
                  Expanded(flex: 2, child: buildPicture()),
                  Expanded(flex: 1, child: buildTextField()),
                  Expanded(flex: 1, child: buildSend()),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(child: buildSignUp()),
                ],
              ),
            )));
  }

  Text buildTitle() => Text(
        LocaleKeys.ForgotPassword_forgotton_password_title.locale,
        style: TextStyle(
            color: Color.fromRGBO(201, 87, 64, 1),
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
      );

  Container buildTextField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Spacer(flex: 3),
          Expanded(
            flex: 14,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: (LocaleKeys.ForgotPassword_email_forgotPage.tr()),
              ),
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Container buildSignUp() {
    return Container(
        child: Row(
      children: <Widget>[
        Text(
          LocaleKeys.dontHaveAnAccount.locale,
          style: TextStyle(fontSize: 20),
        ),
        FlatButton(
          textColor: Colors.blue,
          child: Text(
            LocaleKeys.signUp.tr(),
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {},
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ));
  }

  Container buildSend() {
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 18,
            child: RaisedButton(
              onPressed: () {
                forgotPasswordPageViewModel.email = emailController.text;
                forgotPasswordPageViewModel.sendEmail();
                Navigator.pushNamed(context, "/forgotPassword_code");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                LocaleKeys.ForgotPassword_send_forgotPage.locale,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              color: Colors.deepOrangeAccent[100],
            ),
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }

  Container buildPicture() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(),
      child: SvgPicture.asset(
        artwork,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
