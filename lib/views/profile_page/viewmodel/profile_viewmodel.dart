import 'dart:convert';

import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  String currentName;
  String currentPhone;
  String currentEmail;
  String currentPublishedCount;
  String currentResolvedCount;
  String currentId;
  String currentBirthday;
  String currentPhotoUrl;
  @observable
  bool isLoaded;

  Map<String, String> headers = {
    "Content-Type": "application/graphql",
    "Authorization": null
  };

  Future<bool> getUserData() async {
    var query = """
        { 
          me{
            name
            phone
            email
            publishedCount
            resolvedCount
            id
            birthday
            photo

          }
        }
          """;
    String token = await NetworkManager.instance.getLocaleStringData("token");
    headers["Authorization"] = token;

    var response =
        await NetworkManager.instance.postGraphqlQuery(query, headers);

    Map jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse['errors'] != null) {
      isLoaded = false;
      return false;
    } else {
      currentName = jsonResponse["data"]["me"]["name"];
      currentPhone = jsonResponse["data"]["me"]["phone"];
      currentEmail = jsonResponse["data"]["me"]["email"];
      currentPublishedCount =
          jsonResponse["data"]["me"]["publishedCount"].toString();
      currentResolvedCount =
          jsonResponse["data"]["me"]["resolvedCount"].toString();
      currentId = jsonResponse["data"]["me"]["id"];
      currentBirthday = jsonResponse["data"]["me"]["birthday"];
      currentPhotoUrl = jsonResponse["data"]["me"]["photo"];

      print(response.body);
      isLoaded = true;
      return true;
    }
  }

  void postUserData() async {
    var query = """
      mutation{
        profileEdit(
          name:"$currentName"
          phone:"$currentPhone"
          email:"$currentEmail"
          birthday:"$currentBirthday"
          photo:"$currentPhotoUrl"
        )
      }
    
    """;

    String token = await NetworkManager.instance.getLocaleStringData("token");
    headers["Authorization"] = token;
    print(token);
    var response =
        await NetworkManager.instance.postGraphqlQuery(query, headers);

    print(response.body);
  }
}
