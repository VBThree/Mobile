import 'package:VBThreeMobile/core/constants/breeds.dart';
import 'package:VBThreeMobile/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'post_announcement_viewmodel.g.dart';

class PostAnnouncementViewModel = _PostAnnouncementViewModelBase
    with _$PostAnnouncementViewModel;

abstract class _PostAnnouncementViewModelBase with Store {
  @observable
  String announcementType;

  @observable
  String animalSpecies;

  @observable
  String gender;

  @observable
  String breed;

  @observable
  String description;

  @observable
  List<String> breedList = Breeds.dogBreeds;

  @observable
  ObservableList<bool> isFill = [false, false, false, false].asObservable();

  @action
  void updateFillChecks(int index) {
    isFill[index] = true;
  }

  @action
  void changeFirstBreedName(String animal) {
    switch (animal) {
      case "Dog":
        breed = null;
        breedList = Breeds.dogBreeds;
        break;
      case "Cat":
        breed = null;
        breedList = Breeds.catBreeds;

        break;
      case "Other":
        breed = LocaleKeys.animalNames_Bird.tr();
        breedList = Breeds.otherAnimals;
        break;
    }
  }
}
