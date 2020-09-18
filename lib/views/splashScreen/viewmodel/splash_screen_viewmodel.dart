import 'package:VBThreeMobile/core/init/locale/locale_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewModel = _SplashScreenViewModelBase
    with _$SplashScreenViewModel;

abstract class _SplashScreenViewModelBase with Store {
  @observable
  bool isLoggedIn;

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    if (token != null)
      isLoggedIn = true;
    else
      isLoggedIn= false;
    
    return token;
  }

}
