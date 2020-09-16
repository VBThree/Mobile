import 'package:VBThreeMobile/core/base/view/base_view.dart';
import 'package:VBThreeMobile/core/constants/color.dart';
import 'package:VBThreeMobile/core/constants/radius.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  IconData icon;
  String title;
  int score;
  ProfileListTile(this.icon, this.title, this.score);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28, color: PROFILE_DARK_GREY_BLUE),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: PROFILE_DARK_GREY_BLUE)),
        Spacer(),
        Container(
          child: Center(
              child: Text(
            score.toString(),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          )),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PROFILE_LIST_TILE_RADIUS),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 19,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ]),
        ),
        Padding(
            padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.08,
        ))
      ],
    );
  }
}
