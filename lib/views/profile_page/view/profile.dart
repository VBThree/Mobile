import 'dart:convert';
import 'dart:io';

import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/components/drawer/guestDrawer.dart';
import 'package:VBThreeMobile/core/components/drawer/loggedInDrawer.dart';
import 'package:VBThreeMobile/core/components/profile_card_text.dart';
import 'package:VBThreeMobile/core/components/profile_change_password.dart';
import 'package:VBThreeMobile/core/components/profile_edit_text_input.dart';
import 'package:VBThreeMobile/core/components/profile_listTile_widget.dart';
import 'package:VBThreeMobile/core/components/shadedButton.dart';
import 'package:VBThreeMobile/core/constants/colors.dart';
import 'package:VBThreeMobile/core/constants/radius.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:VBThreeMobile/core/init/network/cloud_storage_result.dart';
import 'package:VBThreeMobile/core/init/network/cloud_storage_service.dart';
import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/mapPage/view/mapPageView.dart';
import 'package:VBThreeMobile/views/profile_page/viewmodel/profile_viewmodel.dart';
import 'package:VBThreeMobile/views/splashScreen/view/splash_screen_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/components/shadedButton.dart';
import '../../../generated/locale_keys.g.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage> {
  ProfileViewModel viewmodel = ProfileViewModel();
  CloudStorageService imageService = CloudStorageService();

  @override
  void initState() {
    super.initState();
    viewmodel.getUserData().then((value) {
      viewmodel.isLoaded = true;
      setState(() {});
    });
  }

  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var dateController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  File _sellectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: LoggedDrawer(),
        appBar: profileAppBar(),
        body: viewmodel.isLoaded != null
            ? profileBody()
            : Center(child: CircularProgressIndicator()));
  }

  SingleChildScrollView profileBody() {
    return SingleChildScrollView(
      child: Builder(
        builder: (context) => Container(
          height: dynamicHeight(1) - Scaffold.of(context).appBarMaxHeight,
          child: Column(
            children: [
              Expanded(flex: 4, child: topCardArea()),
              Expanded(flex: 1, child: dynamicBoxArea()),
              Expanded(flex: 2, child: achievementsListTileArea()),
              Expanded(flex: 2, child: buttonArea())
            ],
          ),
        ),
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
          changePass,
          foregroundColor: AllColors.PROFILE_LIGHT_PEACH,
          textColor: AllColors.PROFILE_BLOWISH_GRAY,
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        ShadedButton(
          LocaleKeys.profilePage_Logout.locale,
          logoutOnpress,
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
          ProfileListTile(
              Icons.assignment_turned_in,
              LocaleKeys.profilePage_Resolved.locale,
              viewmodel.currentResolvedCount),
          ProfileListTile(
              Icons.assignment,
              LocaleKeys.profilePage_Published.locale,
              viewmodel.currentPublishedCount),
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
          ProfileCardText(Feather.phone, viewmodel.currentPhone),
          ProfileCardText(Fontisto.email, viewmodel.currentEmail),
          ProfileCardText(Icons.date_range, viewmodel.currentBirthday),
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
              backgroundImage: viewmodel.currentPhotoUrl != null
                  ? NetworkImage(
                      viewmodel.currentPhotoUrl,
                    )
                  : NetworkImage(
                      "https://w0.pngwave.com/png/873/489/avatar-youtube-cat-cute-dog-png-clip-art.png"),
            ),
          ),
          SizedBox(
            height: dynamicHeight(0.01),
          ),
          Text(
            viewmodel.currentName,
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
      actions: [
        Padding(
          padding: EdgeInsets.only(right: dynamicWidth(0.03)),
          child: IconButton(
            onPressed: editOnPress,
            icon: Icon(Icons.edit),
            color: AllColors.PROFILE_DARK_GREY_BLUE,
          ),
        )
      ],
    );
  }

  void changePass() {
    setState(() {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: Text(LocaleKeys.profilePage_ChangePassword.locale),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Builder(
                  builder: (context) {
                    return Container(
                      height: dynamicHeight(0.3),
                      width: dynamicHeight(0.4),
                      child: Form(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileChangePassTextInput(
                              "${LocaleKeys.profilePage_EnterYourOldPassword.locale}",
                              oldPasswordController),
                          ProfileChangePassTextInput(
                              "${LocaleKeys.profilePage_EnterYourNewPassword.locale}",
                              newPasswordController),
                          ShadedButton(
                            "${LocaleKeys.profilePage_Change.locale}",
                            changeModalPass,
                            foregroundColor: AllColors.PROFILE_TWILIGHT,
                          ),
                        ],
                      )),
                    );
                  },
                ),
              ));
    });
  }

  void logoutOnpress() {
    splashScreenViewModel.isLoggedIn = false;
    NetworkManager.instance.setLocaleStringData("token", null);
    Navigator.pushNamedAndRemoveUntil(context, loginRoute, (e) => false);
  }

  void editOnPress() {
    viewmodel.postUserData();
    Navigator.pushNamedAndRemoveUntil(context, profilePage, (e) => false);
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text(LocaleKeys.profilePage_EditProfile.locale),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Builder(
          builder: (context) {
            return Container(
                height: dynamicHeight(0.5),
                width: dynamicWidth(1),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: uploadImage,
                          child: _sellectedImage == null
                              ? CircleAvatar(
                                  radius: dynamicWidth(0.1),
                                  child: Icon(Icons.add_a_photo))
                              : CircleAvatar(
                                  radius: dynamicWidth(0.1),
                                  backgroundImage:
                                      NetworkImage(viewmodel.currentPhotoUrl),
                                )),
                      Expanded(
                        child: ProfileTextInputWidget(
                            Icons.person,
                            "${LocaleKeys.profilePage_Name.locale}",
                            nameController,
                            false,
                            viewmodel.currentName),
                      ),
                      Expanded(
                        child: ProfileTextInputWidget(
                            Feather.phone,
                            "${LocaleKeys.profilePage_Phone.locale}",
                            phoneController,
                            false,
                            viewmodel.currentPhone),
                      ),
                      Expanded(
                        child: ProfileTextInputWidget(
                            Feather.mail,
                            "${LocaleKeys.profilePage_Email.locale}",
                            emailController,
                            false,
                            viewmodel.currentEmail),
                      ),
                      Expanded(
                        child: ProfileTextInputWidget(
                            Feather.mail,
                            "${LocaleKeys.profilePage_BirtdayDate.locale}",
                            dateController,
                            false,
                            viewmodel.currentBirthday),
                      ),
                      ShadedButton(
                        "${LocaleKeys.profilePage_Change.locale}",
                        () {
                          changeModalPass();
                          Navigator.pushNamedAndRemoveUntil(
                              context, profilePage, (e) => false);
                        },
                        foregroundColor: AllColors.PROFILE_TWILIGHT,
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }

  //changeModalPass

  changeModalPass() {
    viewmodel.currentName = nameController.text.trim();
    viewmodel.currentEmail = emailController.text.trim();
    viewmodel.currentPhone = phoneController.text.trim();
    viewmodel.currentBirthday = dateController.text.trim();

    viewmodel.postUserData();
  }

  void uploadImage() async {
    var galleryImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    CloudStorageResult result =
        await imageService.uploadImage(imageToUpload: File(galleryImage.path));
    viewmodel.currentPhotoUrl = result.imageUrl;
  }
}
