import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'forgot_password_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  Future<void> postForgotPasswordData() async {
    var response = await NetworkManager.instance.postGraphqlQuery("ads", "asd");
    print(response.body);
  }
}
