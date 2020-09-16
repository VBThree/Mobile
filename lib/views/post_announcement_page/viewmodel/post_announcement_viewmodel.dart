import 'package:VBThreeMobile/core/constants/breeds.dart';

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

  @observable
  ObservableList<String> images = ["", "", "", "", "", ""].asObservable();

  @action
  void addImage(_image, index) {
    images[index] = _image;
  }

  @action
  void changeFirstBreedName(String animal) {
    switch (animal) {
      case "Dog":
        breed = breed == null ? null : Breeds.dogBreeds[0];
        breedList = Breeds.dogBreeds;
        break;
      case "Cat":
        breed = breed == null ? null : Breeds.catBreeds[0];
        breedList = Breeds.catBreeds;

        break;
      case "Other":
        breed = breed == null ? null : Breeds.otherAnimals[0];
        breedList = Breeds.otherAnimals;
        break;
    }
  }
}
