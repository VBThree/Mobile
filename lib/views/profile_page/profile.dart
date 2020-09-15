import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/components/profile_card_text.dart';
import 'package:VBThreeMobile/core/constants/color.dart';
import 'package:VBThreeMobile/core/constants/radius.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: profileBody(),
    );
  }

  Container profileBody() {
    return Container(
      child: Column(
        children: [
          Stack(overflow: Overflow.visible, children: [
            imageTextCardArea(),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.28,
                left: MediaQuery.of(context).size.width * 0.125,
                child: contactInfoCard()),
          ]),
        ],
      ),
    );
  }

  Container contactInfoCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileCardText(Feather.phone, "+90 545 xxx xx xx"),
          ProfileCardText(Fontisto.email, "oguzabdullah@gmail.com"),
          ProfileCardText(Icons.date_range, "dd/mm/yyyy"),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 19,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(PROFILE_CARD_RADIUS)),
      width: dynamicWidth(0.78),
      height: dynamicHeight(0.2021),
    );
  }

  Container imageTextCardArea() {
    return Container(
      child: imageTextComponents(),
      decoration: BoxDecoration(
        color: PROFILE_APPBAR_LIGHT_PEACH,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(PROFILE_RADIUS),
            bottomRight: Radius.circular(PROFILE_RADIUS)),
      ),
      width: dynamicWidth(1),
      height: dynamicHeight(0.30),
    );
  }

  Container imageTextComponents() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /* Container(  
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              "assets/shapes/profile_shape1.svg",
            ),
            SVG RESİM ALİGN ETME KONUSUNDA SORUN YAŞADIK
          ) */
          Container(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://avatars3.githubusercontent.com/u/34376691?s=460&u=bb49f483424c3330768c12112b67fc93273896d9&v=4",
              ),
            ),
          ),
          Text(
            "Abdullah Oğuz",
            style: TextStyle(
                color: PROFILE_TWILIGHT,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  AppBar profileAppBar() {
    return AppBar(
      backgroundColor: PROFILE_APPBAR_LIGHT_PEACH,
      toolbarOpacity: 0.7,
      automaticallyImplyLeading: false,
      leading: Icon(
        Icons.menu,
      ),
      actions: [
        Icon(
          Icons.edit,
          color: PROFILE_TWILIGHT,
        )
      ],
    );
  }
}
