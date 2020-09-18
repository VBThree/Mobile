import 'package:flutter/material.dart';

class ProfileCardText extends StatelessWidget {
  ProfileCardText(this.icon, this.profile_contact_text);
  IconData icon;
  String profile_contact_text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: width * 0.064,
        ),
        Spacer(
          flex: 9,
        ),
        Text(profile_contact_text, style: TextStyle(fontSize: width * 0.032)),
      ],
    );
  }
}
