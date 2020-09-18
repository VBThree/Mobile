import 'dart:convert';

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
    "Authorization": null,
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

  @observable
  bool isLoading;

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

  Future<bool> postAnnouncement() async {
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
          date:"2013-10-01",
          coordinates:$coordinates,
          photo:${[...resultUrlList]},
          
          
          ){
          date
        }
      }
      """;
    isLoading = true;
    String token = await NetworkManager.instance.getLocaleStringData("token");
    headers["Authorization"] = token;
    var response = await NetworkManager.instance
        .postGraphqlQuery(postAnnouncementDataQuery, headers);
    print(response.body);
    isLoading = false;
    Map jsonResponse = json.decode(response.body);

    if (jsonResponse['errors'] != null) {
      return false;
    } else {
      return true;
    }
  }
}
