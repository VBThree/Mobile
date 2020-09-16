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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
            child:
                Icon(icon, size: 28, color: AllColors.PROFILE_DARK_GREY_BLUE),
            flex: 2),
        SizedBox(width: width * 0.05),
        Expanded(
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.02,
                    color: AllColors.PROFILE_DARK_GREY_BLUE)),
            flex: 5),
        Spacer(flex: 5),
        Container(
          height: height * 0.06,
          width: height * 0.06,
          child: Center(
              child: Text(
            score.toString(),
            style:
                TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.w600),
          )),
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
          bottom: height * 0.08,
        ))
      ],
    );
  }
}
