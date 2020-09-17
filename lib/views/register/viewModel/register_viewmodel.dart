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

  @action
  void sendData(){
    print(nameSurname);
  }
}


