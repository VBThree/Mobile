import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'forgot_password_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  String email;
  String resetToken;
  String newPassword;
  Future<void> sendEmail() async {
    String emailQuery = """
      mutation{
        requestReset(email:"$email")
      }
    
    """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};

    var response =
        await NetworkManager.instance.postGraphqlQuery(emailQuery, headers);
    print(response.body);
  }

  Future<void> sendKey() async {
    String keyQuery = """
      mutation{
        confirmReset(resetToken:"$resetToken")
      }
    
    """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};

    var response =
        await NetworkManager.instance.postGraphqlQuery(keyQuery, headers);
    print(response.body);
  }

  Future<void> sendNewPassword() async {
    String query = """
      mutation{
        resetPassword(resetToken:"$resetToken",newPassword:"$newPassword")
      }
    
    """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};

    var response =
        await NetworkManager.instance.postGraphqlQuery(query, headers);
    print(response.body);
  }
}
