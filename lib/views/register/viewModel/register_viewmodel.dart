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

  void signUp() async {
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
    print(postRegisterDataQuery);
    Map<String, String> headers = {"Content-Type": "application/graphql"};
    var response = await NetworkManager.instance
        .postGraphqlQuery(postRegisterDataQuery, headers);

    print(response.body);
  }
}
