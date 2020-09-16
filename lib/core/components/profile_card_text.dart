import 'package:flutter/material.dart';

class ProfileCardText extends StatelessWidget {
  ProfileCardText(this.icon, this.profile_contact_text);
  IconData icon;
  String profile_contact_text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        Spacer(
          flex: 9,
        ),
        Text(profile_contact_text),
      ],
    );
  }
}
