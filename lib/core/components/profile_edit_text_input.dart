import 'package:flutter/material.dart';

class ProfileTextInputWidget extends StatelessWidget {
  String labelName;
  var controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordType;
  IconData icon;

  ProfileTextInputWidget(
    this.icon,
    this.labelName,
    this.controller,
    this.passwordType,
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(flex: 1, child: Icon(icon)),
          Expanded(
            flex: 4,
            child: TextFormField(
              obscureText: passwordType,
              controller: controller,
              decoration: InputDecoration(
                labelText: labelName,
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
