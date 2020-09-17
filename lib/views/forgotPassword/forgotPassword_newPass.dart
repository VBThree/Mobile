import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:flutter_svg/svg.dart';

String password = "";
const String artwork = "assets/images/forgotPassword/img2.svg";

class ForgotPassword_new extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword_new> {
  TextEditingController nameController = TextEditingController();

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
                  Expanded(flex: 1, child: buildSave()),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            )));
  }

  Text buildTitle() => Text(
        LocaleKeys.ForgotPassword_reset_pass.locale,
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
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: (LocaleKeys.ForgotPassword_new_pass.locale),
              ),
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }

  Container buildSave() {
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
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                LocaleKeys.ForgotPassword_save.locale,
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
