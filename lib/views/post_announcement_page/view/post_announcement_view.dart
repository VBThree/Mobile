import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/base/view/base_view.dart';
import 'package:VBThreeMobile/core/constants/Color.dart';
import 'package:VBThreeMobile/core/constants/app_constants.dart';
import 'package:VBThreeMobile/core/constants/breeds.dart';
import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/notifiers/theme_notifier.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:VBThreeMobile/views/post_announcement_page/viewmodel/post_announcement_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:VBThreeMobile/core/extension/string_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PostAnnouncementView extends StatefulWidget {
  PostAnnouncementView({Key key}) : super(key: key);

  @override
  _PostAnnouncementViewState createState() => _PostAnnouncementViewState();
}

class _PostAnnouncementViewState extends BaseState<PostAnnouncementView> {
  PostAnnouncementViewModel viewModel = PostAnnouncementViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context, value) => buildScaffold(),
      viewModel: viewModel,
      onModelReady: (model) {
        viewModel = model;
      },
    );
  }

  Scaffold buildScaffold() => Scaffold(
        body: buildMainColumn(),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.cached),
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .changeTheme();
                }),
            IconButton(
                icon: Icon(Icons.language),
                onPressed: () {
                  final tr = LanguageManager.instance.trLocale;
                  final en = LanguageManager.instance.enLocale;
                  context.locale = context.locale == tr ? en : tr;
                })
          ],
        ),
      );

  Column buildMainColumn() => Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.05),
          ),
          Expanded(child: buildTitleAndImage(), flex: 2),
          Expanded(child: buildAddPhoto(), flex: 1),
          Expanded(child: buildForm(), flex: 5),
          Expanded(child: buildSubmitButton(), flex: 1)
        ],
      );

  Text buildAddPhoto() => Text('Add Photo');

  Row buildTitleAndImage() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 1),
          Expanded(child: buildPageTitle(), flex: 4),
          Expanded(
            flex: 5,
            child: SvgPicture.asset(
                ApplicationConstants.ADD_ANNOUNCEMENT_PAGE_IMAGE_PATH),
          ),
        ],
      );

  Text buildPageTitle() {
    return Text(LocaleKeys.postAnnouncementPage_title.locale,
        style: TextStyle(
          fontSize: dynamicHeight(0.05),
          color: AllColors.darkGreyBlue,
        ));
  }

  Text buildSubmitButton() => Text('Submit button');

  Observer buildForm() {
    return Observer(
      builder: (_) => Column(
        children: [
          Row(
            children: [
              Spacer(flex: 1),
              Expanded(flex: 6, child: buildTypeDropdown()),
              Spacer(flex: 1)
            ],
          ),
          Row(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 6,
                child: pickSpeciesDropdownOrContainer(),
              ),
              Spacer(flex: 1)
            ],
          ),
          Row(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 6,
                child: pickBreedsDropdownOrContainer(),
              ),
              Spacer(flex: 1)
            ],
          ),
          Row(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 6,
                child: pickGenderDropdownOrContainer(),
              ),
              Spacer(flex: 1)
            ],
          ),
          Row(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 6,
                child: pickDescriptionFieldOrContainer(),
              ),
              Spacer(flex: 1)
            ],
          ),
        ],
      ),
    );
  }

  // If upper field is not empty, build dropdown field
  StatelessWidget pickSpeciesDropdownOrContainer() {
    return (viewModel.isFill[0] == true ? buildSpeciesDropdown() : Container());
  }

  StatelessWidget pickBreedsDropdownOrContainer() {
    return (viewModel.isFill[1] == true ? buildBreedsDropdown() : Container());
  }

  StatelessWidget pickGenderDropdownOrContainer() {
    return (viewModel.isFill[2] == true ? buildGenderDropdown() : Container());
  }

  StatelessWidget pickDescriptionFieldOrContainer() {
    return (viewModel.isFill[3] == true ? Text('Description') : Container());
  }

  Observer buildTypeDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<String>(
        isExpanded: true,
        hint: Text(LocaleKeys.postAnnouncementPage_announcementTypeHint.locale),
        value: viewModel.announcementType,
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
            child: Text(_pickedValue),
          );
        }).toList(),
        onChanged: (selected) {
          viewModel.announcementType = selected;
          viewModel.updateFillChecks(0);
        },
      ),
    );
  }

  Observer buildSpeciesDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<String>(
        isExpanded: true,
        value: viewModel.animalSpecies,
        hint: Text(LocaleKeys.postAnnouncementPage_speciesHine.locale),
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
            child: Text(_pickedValue),
          );
        }).toList(),
        onChanged: (selected) {
          viewModel.changeFirstBreedName(selected);
          viewModel.animalSpecies = selected;
          viewModel.updateFillChecks(1);
        },
      ),
    );
  }

  Observer buildBreedsDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<String>(
        isExpanded: true,
        hint: Text(LocaleKeys.postAnnouncementPage_breedHint.locale),
        value: viewModel.breed,
        items: viewModel.breedList.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (selected) {
          viewModel.breed = selected;
          viewModel.updateFillChecks(2);
        },
      ),
    );
  }

  Observer buildGenderDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<String>(
        isExpanded: true,
        hint: Text(LocaleKeys.postAnnouncementPage_genderHint.locale),
        value: viewModel.gender,
        items: <String>['Female', 'Male'].map((String _value) {
          String _pickedValue = LocaleKeys.announcementTypes_Lost.locale;
          switch (_value) {
            case "Male":
              _pickedValue = LocaleKeys.genders_maleHumanAndAnimal.locale;
              break;
            case "Female":
              _pickedValue = LocaleKeys.genders_femaleAnimal.locale;
              break;
          }

          return new DropdownMenuItem<String>(
            value: _value,
            child: Text(_pickedValue),
          );
        }).toList(),
        onChanged: (selected) {
          viewModel.gender = selected;
          viewModel.updateFillChecks(3);
        },
      ),
    );
  }
}
