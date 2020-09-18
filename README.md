# SuperPaw Project

This is the repository of SuperPaw mobile application.

## Getting Started

SuperPaw is designed for our animal friends who live on the streets and need help. With SuperPaw, users can share the needs of the animal friend they want to help with other users and establish a help network. This project is backend project of Superpaw. This project runs on Node.js with a MongoDB database.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/VBThree/Mobile.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Go to project root and execute the following command to run the project:

```
flutter run
```


## SuperPaw Features:

* Splash
* Login
* Home
* Routing
* GraphQL queries and mutations
* MobX (to connect the reactive data of SuperPaw with the UI)
* Provider (State Management)
* Dark Theme Support
* Multilingual Support
* Lottie (for animations)

### Libraries & Tools Used

* [MobX](https://github.com/mobxjs/mobx.dart) (to connect the reactive data of your application with the UI)
* [Provider](https://github.com/rrousselGit/provider) (State Management)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- generated/
|- views/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- core - All core features stored in this folder. For example networking processes.
2- generated - Contains the generated code.
3- views - Contains screens of application. We store here Views and ViewModels. 
8- main.dart - This is the starting point of the application.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
core/constants/
|- app_constants.dart
|- breeds.dart
|- colors.dart
|- radius.dart
```

### Init

All the business logic of your application will go into this directory. It is sub-divided into six directories `lang`, `locale`, `navigation`, `network`, `notifiers` and `theme`, each has the domain specific logic.

```
init/
|- lang/
    |- language_manager.dart
   
|- locale/
    |- locale_manager.dart
    
|- navigation
    |- router.dart

|- network
    |- cloud_storage_result.dart
    |- cloud_storage_service.dart
    |- network_manager.dart

|- notifiers
    |- application_providers.dart
    |- theme_notifier.dart

|- theme
    |- dark_theme/
    |- light_theme/
    |- app_theme.dart

```

### Views

This directory contains all the ui of SuperPaw. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen directories are like in the example below:

```
views/
|- loginPage
   |- view
      |- loginPage.dart
   |- widgets
      |- login_viewmodel.dart
      |- login_viewmodel.g.dart
```


### Main

This is the starting point of SuperPaw.

```dart
import 'package:VBThreeMobile/core/init/lang/language_manager.dart';
import 'package:VBThreeMobile/core/init/navigation/router.dart';
//import 'package:VBThreeMobile/views/forgotPassword/forgotPassword_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/init/notifiers/application_providers.dart';
import 'core/init/notifiers/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [...ApplicationProviders.instance.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANGUAGE_ASSET_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
        onGenerateRoute: Router.generateRoute,
        initialRoute: register);
  }
}
```

## Contributors

Thanks to the following people who have contributed to this project:

<table>
  <tr>
    <td align="center"><a href="https://github.com/erturkgurses"><img src="https://avatars1.githubusercontent.com/u/40302490?s=460&v=4" width="100px;" alt=""/><br /><sub><b>Ertürk Gürses</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=erturkgurses" title="Submitted Codes">💻</a> <a href="https://github.com/VBThree/Mobile/pulls?q=is%3Apr+reviewed-by%3Aerturkgurses" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/yusufozgul"><img src="https://avatars1.githubusercontent.com/u/26109252?s=460&u=23044912cc512095974a7b30b74c5458b48f6246&v=4" width="100px;" alt=""/><br /><sub><b>Yusuf Özgül</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=yusufozgul" title="Submitted Codes">💻</a> <a href="https://github.com/VBThree/Mobile/pulls?q=is%3Apr+reviewed-by%3Ayusufozgul" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/ertugrulozvardar"><img src="https://avatars2.githubusercontent.com/u/44060683?s=460&u=eab6f1c0b923a7b306d5ceb4b3ed0002582d287c&v=4" width="100px;" alt=""/><br /><sub><b>Ertuğrul Özvardar</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=ertugrulozvardar" title="Submitted Codes">💻</a> <a href="https://github.com/VBThree/Mobile/pulls?q=is%3Apr+reviewed-by%3Aertugrulozvardar" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/aoguz1"><img src="https://avatars3.githubusercontent.com/u/34376691?s=460&u=bb49f483424c3330768c12112b67fc93273896d9&v=4" width="100px;" alt=""/><br /><sub><b>Abdullah Oğuz</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=aoguz1" title="Submitted Codes">💻</a> <a href="https://github.com/VBThree/Mobile/pulls?q=is%3Apr+reviewed-by%3Aaoguz1" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/basakgunay"><img src="https://avatars3.githubusercontent.com/u/49794486?s=460&u=b9ebbb62859daa7e4b57591ec22200e0acdd9846&v=4" width="100px;" alt=""/><br /><sub><b>Başak Günay</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=basakgunay" title="Submitted Codes">💻</a> <a href="https://github.com/VBThree/Mobile/pulls?q=is%3Apr+reviewed-by%3Abasakgunay" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/ahmetbicer"><img src="https://avatars0.githubusercontent.com/u/45371442?s=460&u=7ba9f4c5cbaf5d318ce1ae206e74049dcd04c122&v=4" width="100px;" alt=""/><br /><sub><b>Ahmet Biçer</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=ahmetbicer" title="Submitted Codes">💻</a>
    <td align="center"><a href="https://github.com/mertcb"><img src="https://avatars0.githubusercontent.com/u/36340604?s=460&u=cf4b42d52c989f52580a8cb635e04b4db4a02c6f&v=4" width="100px;" alt=""/><br /><sub><b>Mert Can Bilgiç</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=ahmetbicer" title="Submitted Codes">💻</a></td>
    <td align="center"><a href="https://github.com/VB10"><img src="https://avatars1.githubusercontent.com/u/17102578?s=460&u=8d0c2fa492d36b0c109e09d66213e4bd12d8fb6b&v=4" width="100px;" alt=""/><br /><sub><b>Veli Bacık</b></sub></a><br /><a href="https://github.com/VBThree/Mobile/commits?author=VB10" title="Submitted Codes">💻</a></td>
  </tr>
</table>


## License

This project uses the following license: [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).

