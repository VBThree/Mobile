import 'dart:convert';

import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  String nameSurname;
  @observable
  String email;
  @observable
  String phone;
  @observable
  String dateOfBirth;
  @observable
  String password;

  Future<bool> signUp() async {
    String postRegisterDataQuery = """
        mutation{ 
          register(
            name:"$nameSurname",
          email:"$email",
          password:"$password",
          phone:"$phone",
          birthday:"$dateOfBirth",
          )
        }
          """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};
    var response = await NetworkManager.instance
        .postGraphqlQuery(postRegisterDataQuery, headers);

    Map jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse['errors'] != null) {
      return false;
    } else {
      
      await NetworkManager.instance
          .setLocaleStringData("token", jsonResponse["data"]["register"]);

      return true;
    }
  }
}
