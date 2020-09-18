import 'dart:convert';

import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  String email;
  @observable
  String password;

  Future<bool> signIn() async {
    var postLoginDataQuery = """
        mutation{ 
          login(
          email:"$email",
          password:"$password",
        
          )
        }
          """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};
    print(postLoginDataQuery);
    var response = await NetworkManager.instance
        .postGraphqlQuery(postLoginDataQuery, headers);

    Map jsonResponse = json.decode(response.body);

    if (jsonResponse['errors'] != null) {
       return false;
    } else {
      print(jsonResponse["data"]["login"]);
      await NetworkManager.instance
          .setLocaleStringData("token", jsonResponse["data"]["login"]);
      return true;
    }
  }
}
