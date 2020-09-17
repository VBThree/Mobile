import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/components/drawer/sideNaviBar.dart';
import 'package:VBThreeMobile/core/components/profile_card_text.dart';
import 'package:VBThreeMobile/core/components/profile_listTile_widget.dart';
import 'package:VBThreeMobile/core/components/shadedButton.dart';
import 'package:VBThreeMobile/core/constants/colors.dart';
import 'package:VBThreeMobile/core/constants/radius.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/profile_page/viewmodel/profile_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage> {
  ProfileViewModel viewmodel = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    viewmodel.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyNavBar((value) => {
            context.locale = value,
          }),
      appBar: profileAppBar(),
      body: profileBody(),
    );
  }

  Container profileBody() {
    return Container(
      child: Column(
        children: [
          Expanded(flex: 4, child: topCardArea()),
          Expanded(flex: 1, child: dynamicBoxArea()),
          Expanded(flex: 2, child: achievementsListTileArea()),
          Expanded(flex: 2, child: buttonArea())
        ],
      ),
    );
  }

  SizedBox dynamicBoxArea() {
    return SizedBox(
      // iletişim cardı ile başarılar kısmını dinamik olarak ayarlar
      height: dynamicHeight(0.2124),
    );
  }

  Column buttonArea() {
    return Column(
      children: [
        ShadedButton(
          LocaleKeys.profilePage_ChangePassword.locale,
          changePass(),
          foregroundColor: AllColors.PROFILE_LIGHT_PEACH,
          textColor: AllColors.PROFILE_BLOWISH_GRAY,
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        ShadedButton(
          LocaleKeys.profilePage_Logout.locale,
          logoutOnpress(),
          foregroundColor: AllColors.PROFILE_ROSE_PINK,
          textColor: AllColors.PROFILE_BLOWISH_GRAY,
        ),
      ],
    );
  }

  Padding achievementsListTileArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.09)),
      child: Column(
        children: [
          achievementsText(),
          ProfileListTile(Icons.assignment_turned_in,
              LocaleKeys.profilePage_Resolved.locale, 50),
          ProfileListTile(
              Icons.assignment, LocaleKeys.profilePage_Published.locale, 80),
        ],
      ),
    );
  }

  Container achievementsText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.05)),
        child: Text(
          LocaleKeys.profilePage_Achievements.locale,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: dynamicWidth(0.05),
            color: AllColors.PROFILE_DARK_GREY_BLUE,
          ),
        ));
  }

  Stack topCardArea() {
    return Stack(overflow: Overflow.visible, children: [
      imageTextCardArea(),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.28,
        left: MediaQuery.of(context).size.width * 0.125,
        child: contactInfoCard(),
      ),
    ]);
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
        color: AllColors.PROFILE_LIGHT_PEACH,
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
             SVG RESİM ALİGN ETME KONUSUNDA SORUN YAŞADIK) */
          Container(
            child: CircleAvatar(
              radius: dynamicWidth(0.18),
              backgroundImage: NetworkImage(
                "https://avatars3.githubusercontent.com/u/34376691?s=460&u=bb49f483424c3330768c12112b67fc93273896d9&v=4",
              ),
            ),
          ),
          SizedBox(
            height: dynamicHeight(0.01),
          ),
          Text(
            "Abdullah Oğuz",
            style: TextStyle(
                color: AllColors.PROFILE_DARK_GREY_BLUE,
                fontSize: dynamicWidth(0.06),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: dynamicHeight(0.03)),
        ],
      ),
    );
  }

  AppBar profileAppBar() {
    return AppBar(
      backgroundColor: AllColors.PROFILE_LIGHT_PEACH,
      shadowColor: Colors.transparent,
      toolbarOpacity: 0.7,
      iconTheme: IconThemeData(
        color: AllColors.PROFILE_DARK_GREY_BLUE,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: dynamicWidth(0.03)),
          child: Icon(
            Icons.edit,
            color: AllColors.PROFILE_DARK_GREY_BLUE,
          ),
        )
      ],
    );
  }

  Function changePass() {}

  Function logoutOnpress() {}
}
