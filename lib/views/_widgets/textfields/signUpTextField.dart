import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final title;
  final height;
  final controller;
  const SignUpTextField({Key key, this.title, this.height, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return coreTextField();
  }

  TextField coreTextField() {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            hintStyle: TextStyle(color: Color.fromRGBO(245, 245, 245, 1)),
            hintText: title,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(245, 245, 245, 1), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5)))));
  }
}
