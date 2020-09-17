import 'package:flutter/material.dart';

class ProfileChangePassTextInput extends StatelessWidget {
  String labelText;
  var controller = TextEditingController();
  ProfileChangePassTextInput(this.labelText, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
          )),
    );
  }
}
