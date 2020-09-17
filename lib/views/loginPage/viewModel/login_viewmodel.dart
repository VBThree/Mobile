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
    
    final postLoginDataQuery = {
    "query":
        "mutation{\n  register(\n    name:\"dasdas\"\n    email:\"$email\"\n    password:\"1234\"\n\t\tphone:\"43233243432\"\n    birthday:\"2000-11-05T06:30:00.000Z\"\n    rating:1.2\n    photo:\"\"\n  )\n}\n\n# {\n#   users{\n#     birthday\n#   }\n# }"
  };
    var response = await NetworkManager.instance.postLoginData();
    print(response.body);
  }
}
