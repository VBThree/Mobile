import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class ForgotPassword_code extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(LocaleKeys.ForgotPassword_digitcode.locale,
        style: TextStyle(
            color: Color.fromRGBO(201, 87, 64, 1),
            fontSize: 30.0,
            fontWeight: FontWeight.bold),),
            Expanded(flex: 1, child: buildPinEntryTextField(context)),
            Expanded(flex: 1, child: buildContainerButton()),
            Spacer(flex: 1)
          ],
        ),
      ),
    ));
  }

  PinEntryTextField buildPinEntryTextField(BuildContext context) {
    return PinEntryTextField(
        fields: 6,
        onSubmit: (String pin) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Pin"),
                  content: Text('Pin entered is $pin'),
                );
              });
        });
  }
}

Container buildContainerButton() {
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              LocaleKeys.ForgotPassword_continue.locale,
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
