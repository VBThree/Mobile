import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/views/_widgets/textfields/signUpTextField.dart';
import 'package:VBThreeMobile/views/register/viewModel/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  RegisterViewModel viewModel = RegisterViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        backgroundColor: Colors.blue[600],
        body: SingleChildScrollView(
          child: Builder(
            builder: (context) => Container(
                height: dynamicHeight(1) - Scaffold.of(context).appBarMaxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Expanded(flex: 3, child: signUpText()),
                    Spacer(flex: 5),
                    Expanded(flex: 3, child: nameSurnameTextField()),
                    Spacer(flex: 1),
                    Expanded(flex: 3, child: emailTextField()),
                    Spacer(flex: 1),
                    Expanded(flex: 3, child: phoneNumberTextField()),
                    Spacer(flex: 1),
                    Expanded(flex: 3, child: dateOfBirthTextField()),
                    Spacer(flex: 1),
                    Expanded(flex: 3, child: passwordTextField()),
                    Spacer(flex: 3),
                    Expanded(flex: 3, child: signUpButton()),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadySignedUpText(),
                          signInButton(),
                        ],
                      ),
                    ),
                    Spacer(flex: 4)
                  ],
                )),
          ),
        ));
  }

  Container profileImageAndAddButton() {
    return Container(
      child: Container(
        child: MaterialButton(
          onPressed: () {},
          color: Color.fromRGBO(255, 255, 255, 20),
          child: Icon(
            Icons.add_circle_outline,
            color: Color.fromRGBO(255, 199, 173, 1),
            size: 40,
          ),
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
      width: dynamicWidth(0.4),
      height: dynamicHeight(0.4),
      decoration: BoxDecoration(shape: BoxShape.circle),
    );
  }

  FlatButton signInButton() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        LocaleKeys.authStrings_signIn.locale,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      color: Colors.transparent,
      textColor: Colors.black,
    );
  }

  Text alreadySignedUpText() =>
      Text(LocaleKeys.authStrings_alreadySignedUp.locale);

  Row signUpButton() {
    return Row(
      children: [
        Spacer(flex: 3),
        Expanded(
          flex: 14,
          child: RaisedButton(
            onPressed: () {
              viewModel.nameSurname = nameController.text;
              viewModel.email = emailController.text;
              viewModel.phone = phoneController.text;
              viewModel.dateOfBirth = dateController.text;
              viewModel.password = passwordController.text;
              viewModel.sendData();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              LocaleKeys.authStrings_signUp.locale,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.deepOrangeAccent[100],
          ),
        ),
        Spacer(flex: 3)
      ],
    );
  }

  Row passwordTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
              flex: 14,
              child: SignUpTextField(
                  controller: passwordController,
                  title: LocaleKeys.authStrings_password.locale,
                  height: dynamicHeight(0.04))),
          Spacer(flex: 3)
        ],
      );

  Row dateOfBirthTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
              flex: 14,
              child: SignUpTextField(
                  controller: dateController,
                  title: LocaleKeys.authStrings_dateOfBirth.locale,
                  height: dynamicHeight(0.04))),
          Spacer(flex: 3)
        ],
      );

  Row phoneNumberTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
              flex: 14,
              child: SignUpTextField(
                  controller: phoneController,
                  title: LocaleKeys.authStrings_phoneNumber.locale,
                  height: dynamicHeight(0.04))),
          Spacer(flex: 3)
        ],
      );

  Row emailTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
              flex: 14,
              child: SignUpTextField(
                  controller: emailController,
                  title: LocaleKeys.authStrings_email.locale,
                  height: dynamicHeight(0.04))),
          Spacer(flex: 3)
        ],
      );

  Row nameSurnameTextField() => Row(
        children: [
          Spacer(flex: 3),
          Expanded(
              flex: 14,
              child: SignUpTextField(
                  controller: nameController,
                  title: LocaleKeys.authStrings_nameSurname.locale,
                  height: dynamicHeight(0.04))),
          Spacer(flex: 3)
        ],
      );

  Text signUpText() => Text(LocaleKeys.authStrings_signUp.locale,
      style: TextStyle(
          color: Color.fromRGBO(201, 87, 64, 50),
          fontWeight: FontWeight.bold,
          fontSize: dynamicHeight(0.04)));
}
