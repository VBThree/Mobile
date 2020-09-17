import 'package:VBThreeMobile/core/init/locale/locale_manager.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewModel = _SplashScreenViewModelBase
    with _$SplashScreenViewModel;

abstract class _SplashScreenViewModelBase with Store {
  void checkToken() {
    var _token = LocaleManager.getToken("token");

    print(_token);
  }

  Future<void> setToken() async {
    await LocaleManager.putToken("token", "ins");
  }
}
