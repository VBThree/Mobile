import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  String email;
  @observable
  String password;

  void signIn() async {
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

    print(response.body);
  }
}
