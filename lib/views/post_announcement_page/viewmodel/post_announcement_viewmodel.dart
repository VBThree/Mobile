import 'package:VBThreeMobile/core/constants/breeds.dart';
import 'package:VBThreeMobile/core/init/network/cloud_storage_result.dart';
import 'package:VBThreeMobile/core/init/network/cloud_storage_service.dart';
import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:mobx/mobx.dart';
part 'post_announcement_viewmodel.g.dart';

class PostAnnouncementViewModel = _PostAnnouncementViewModelBase
    with _$PostAnnouncementViewModel;

abstract class _PostAnnouncementViewModelBase with Store {
  Map<String, String> headers = {
    "Authorization":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmNjFiZmQ1ZTBlNTQ5MTJjNTE0M2VjMiIsImlhdCI6MTYwMDM0NTI2MSwiZXhwIjoxNjMxOTAyODYxfQ._VmUw581XSFrxt8Xt4JqVetKWnfrS5yusc_E0H7UVb8",
    "Content-Type": "application/graphql"
  };
  String postAnnouncementDataQuery;

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

  List<String> resultUrlList = List<String>();

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

  void postAnnouncement() async {
    Location location = Location();
    var coordinates;
    await location.getLocation().then((currentLocation) {
      coordinates =
          [currentLocation.longitude, currentLocation.latitude].toString();
    });

    String postAnnouncementDataQuery = """
      mutation{
        addAnnouncement(
          type:$announcementType,
          species:$animalSpecies,
          gender:$gender,
          breed:"$breed",
          description:"$description",
          status:Active,
          date:"2013-10-01T00:00:00.000Z",
          coordinates:$coordinates,
          photo:${[...resultUrlList]},
          
          
          ){
          date
        }
      }
      """;
    var response = await NetworkManager.instance
        .postGraphqlQuery(postAnnouncementDataQuery, headers);
    print(response.body);
  }
}
