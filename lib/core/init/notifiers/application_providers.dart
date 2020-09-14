import 'package:VBThreeMobile/core/init/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProviders {
  static ApplicationProviders _instance;

  static ApplicationProviders get instance {
    if (_instance == null) _instance = ApplicationProviders.init();
    return _instance;
  }

  ApplicationProviders.init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
  List<SingleChildWidget> singleItems = [];
}
