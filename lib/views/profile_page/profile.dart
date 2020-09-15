import 'package:VBThreeMobile/core/base/state/base_state.dart';
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
        children: [imageTextCardArea()],
      ),
    );
  }

  Container imageTextCardArea() {
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Container(  
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                "assets/shapes/profile_shape1.svg",
              ),
              SVG RESİM ALİGN ETME KONUSUNDA SORUN YAŞADIK
            ) */
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          "https://avatars3.githubusercontent.com/u/34376691?s=460&u=bb49f483424c3330768c12112b67fc93273896d9&v=4",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
              ),
            ),
          ],
        ),
      ),
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
