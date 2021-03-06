import 'package:VBThreeMobile/core/init/navigation/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/components/customed_dropdown_container.dart';
import '../../../core/components/drawer/guestDrawer.dart';
import '../../../core/components/shadedButton.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extension/string_extension.dart';
import '../../../generated/locale_keys.g.dart';
import '../viewmodel/post_announcement_viewmodel.dart';

var postAnnouncementViewModel = PostAnnouncementViewModel();

class PostAnnouncementView extends StatefulWidget {
  PostAnnouncementView({Key key}) : super(key: key);

  @override
  _PostAnnouncementViewState createState() => _PostAnnouncementViewState();
}

class _PostAnnouncementViewState extends BaseState<PostAnnouncementView> {

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, value) => buildScaffold(),
      viewModel: postAnnouncementViewModel,
      onModelReady: (model) {
        postAnnouncementViewModel = model;
      },
    );
  }

  Scaffold buildScaffold() => Scaffold(
        drawer: GuestDrawer(),
        body: buildSingleChildScrollViewAsScaffoldBody(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AllColors.PROFILE_DARK_GREY_BLUE,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

  SingleChildScrollView buildSingleChildScrollViewAsScaffoldBody() {
    return SingleChildScrollView(
        child: Builder(
      builder: (context) => Container(
        child: buildMainColumn(),
        height: dynamicHeight(1) - Scaffold.of(context).appBarMaxHeight,
      ),
    ));
  }

  Column buildMainColumn() => Column(
        children: [
          Spacer(flex: 1),
          Expanded(child: buildTitleAndImage(), flex: 5),
          Spacer(flex: 1),
          Expanded(child: buildForm(), flex: 10),
          Spacer(flex: 1),
          Expanded(child: buildSubmitButton(), flex: 4),
          Spacer(flex: 1),
        ],
      );

  Column buildTitleAndImage() => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Expanded(child: buildPageTitle(), flex: 5),
              Expanded(
                flex: 5,
                child: SvgPicture.asset(
                    ApplicationConstants.ADD_ANNOUNCEMENT_PAGE_IMAGE_PATH),
              ),
            ],
          ),
        ],
      );

  Text buildPageTitle() {
    return Text(LocaleKeys.postAnnouncementPage_title.locale,
        style: TextStyle(
          fontSize: dynamicHeight(0.05),
          color: AllColors.PROFILE_DARK_GREY_BLUE,
        ));
  }

  ShadedButton buildSubmitButton() =>
      ShadedButton(LocaleKeys.postAnnouncementPage_addPhotoButton.locale.tr(),
          () {
        Navigator.pushNamedAndRemoveUntil(
            context, postAnnouncementPageAddImageView, (e) => false);
      });

  Observer buildForm() {
    return Observer(
      builder: (_) => Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(flex: 8, child: buildTypeDropdown()),
                Spacer(flex: 1)
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 8,
                  child: pickSpeciesDropdownOrContainer(),
                ),
                Spacer(flex: 1)
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 8,
                  child: pickBreedsDropdownOrContainer(),
                ),
                Spacer(flex: 1)
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 8,
                  child: pickGenderDropdownOrContainer(),
                ),
                Spacer(flex: 1)
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 8,
                  child: pickDescriptionFieldOrContainer(),
                ),
                Spacer(flex: 1)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // If upper field is not empty, build dropdown field
  Widget pickSpeciesDropdownOrContainer() =>
      (postAnnouncementViewModel.isFill[0] == true
          ? buildSpeciesDropdown()
          : Container());

  Widget pickBreedsDropdownOrContainer() {
    return (postAnnouncementViewModel.isFill[1] == true
        ? buildBreedsDropdown()
        : Container());
  }

  Widget pickGenderDropdownOrContainer() {
    return (postAnnouncementViewModel.isFill[2] == true
        ? buildGenderDropdown
        : Container());
  }

  Widget pickDescriptionFieldOrContainer() {
    return (postAnnouncementViewModel.isFill[3] == true
        ? buildDescriptionField
        : Container());
  }

  Container get buildDescriptionField => Container(
        // hack textfield height
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AllColors.GREY_FOR_BOX_SHADOW.withAlpha(100),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TextField(
            maxLines: 5,
            style: TextStyle(fontSize: dynamicHeight(0.02)),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.transparent, style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: LocaleKeys.postAnnouncementPage_descriptionHint.locale,
            ),
            onChanged: (value) {
              postAnnouncementViewModel.description = value;
            },
          ),
        ),
      );

  CustomedDropdownContainer buildTypeDropdown() {
    return CustomedDropdownContainer(
      height: dynamicHeight(0.04),
      child: Observer(
        builder: (_) => DropdownButton<String>(
          hint: Row(
            children: [
              SizedBox(
                width: dynamicWidth(0.035),
              ),
              Text(LocaleKeys.postAnnouncementPage_announcementTypeHint.locale,
                  style: TextStyle(fontSize: dynamicHeight(0.02))),
            ],
          ),
          value: postAnnouncementViewModel.announcementType,
          items: <String>['Lost', 'Food', 'Ownership', 'Vaccination']
              .map((String value) {
            String _pickedValue = LocaleKeys.announcementTypes_Lost.locale;
            switch (value) {
              case "Lost":
                _pickedValue = LocaleKeys.announcementTypes_Lost.locale;
                break;
              case "Food":
                _pickedValue = LocaleKeys.announcementTypes_Food.locale;
                break;
              case "Ownership":
                _pickedValue = LocaleKeys.announcementTypes_Ownership.locale;
                break;
              case "Vaccination":
                _pickedValue = LocaleKeys.announcementTypes_Vaccination.locale;
                break;
            }

            return new DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  SizedBox(
                    width: dynamicWidth(0.035),
                  ),
                  Text(_pickedValue,
                      style: TextStyle(fontSize: dynamicHeight(0.02))),
                ],
              ),
            );
          }).toList(),
          onChanged: (selected) {
            postAnnouncementViewModel.announcementType = selected;
            postAnnouncementViewModel.updateFillChecks(0);
          },
        ),
      ),
    );
  }

  CustomedDropdownContainer buildSpeciesDropdown() {
    return CustomedDropdownContainer(
      height: dynamicHeight(0.04),
      child: Observer(
        builder: (_) => DropdownButton<String>(
          isExpanded: true,
          value: postAnnouncementViewModel.animalSpecies,
          hint: Row(
            children: [
              SizedBox(
                width: dynamicWidth(0.035),
              ),
              Text(LocaleKeys.postAnnouncementPage_speciesHint.locale,
                  style: TextStyle(fontSize: dynamicHeight(0.02))),
            ],
          ),
          items: <String>['Dog', 'Cat', 'Other'].map((String value) {
            String _pickedValue = LocaleKeys.animalNames_Dog.locale;
            switch (value) {
              case "Dog":
                _pickedValue = LocaleKeys.animalNames_Dog.locale;
                break;
              case "Cat":
                _pickedValue = LocaleKeys.animalNames_Cat.locale;
                break;
              case "Other":
                _pickedValue =
                    LocaleKeys.postAnnouncementPage_otherAnimals.locale;
                break;
            }

            return new DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  SizedBox(
                    width: dynamicWidth(0.035),
                  ),
                  Text(_pickedValue,
                      style: TextStyle(fontSize: dynamicHeight(0.02))),
                ],
              ),
            );
          }).toList(),
          onChanged: (selected) {
            postAnnouncementViewModel.changeFirstBreedName(selected);
            postAnnouncementViewModel.animalSpecies = selected;
            postAnnouncementViewModel.updateFillChecks(1);
          },
        ),
      ),
    );
  }

  CustomedDropdownContainer buildBreedsDropdown() {
    return CustomedDropdownContainer(
      height: dynamicHeight(0.04),
      child: Observer(
        builder: (_) => DropdownButton<String>(
          isExpanded: true,
          hint: Row(
            children: [
              SizedBox(
                width: dynamicWidth(0.035),
              ),
              Text(LocaleKeys.postAnnouncementPage_breedHint.locale,
                  style: TextStyle(fontSize: dynamicHeight(0.02))),
            ],
          ),
          value: postAnnouncementViewModel.breed,
          items: postAnnouncementViewModel.breedList.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  SizedBox(
                    width: dynamicWidth(0.035),
                  ),
                  Text(value, style: TextStyle(fontSize: dynamicHeight(0.02))),
                ],
              ),
            );
          }).toList(),
          onChanged: (selected) {
            postAnnouncementViewModel.breed = selected;
            postAnnouncementViewModel.updateFillChecks(2);
          },
        ),
      ),
    );
  }

  CustomedDropdownContainer get buildGenderDropdown =>
      CustomedDropdownContainer(
        height: dynamicHeight(0.04),
        child: Observer(
            builder: (_) => DropdownButton<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      SizedBox(
                        width: dynamicWidth(0.035),
                      ),
                      Text(LocaleKeys.postAnnouncementPage_genderHint.locale,
                          style: TextStyle(fontSize: dynamicHeight(0.02))),
                    ],
                  ),
                  value: postAnnouncementViewModel.gender,
                  items: <String>['Female', 'Male'].map((String _value) {
                    String _pickedValue =
                        LocaleKeys.announcementTypes_Lost.locale;
                    switch (_value) {
                      case "Male":
                        _pickedValue =
                            LocaleKeys.genders_maleHumanAndAnimal.locale;
                        break;
                      case "Female":
                        _pickedValue = LocaleKeys.genders_femaleAnimal.locale;
                        break;
                    }

                    return new DropdownMenuItem<String>(
                      value: _value,
                      child: Row(
                        children: [
                          SizedBox(
                            width: dynamicWidth(0.035),
                          ),
                          Text(_pickedValue,
                              style: TextStyle(fontSize: dynamicHeight(0.02))),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (selected) {
                    postAnnouncementViewModel.gender = selected;
                    postAnnouncementViewModel.updateFillChecks(3);
                  },
                )),
      );
}
