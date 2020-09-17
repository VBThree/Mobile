import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:mobx/mobx.dart';
part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  void getUserData() async {
    var query = """
        { 
          me{
            name
            phone
            email
            publishedCount
            resolvedCount
            id
            birthday

          }
        }
          """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};

    var response =
        await NetworkManager.instance.postGraphqlQuery(query, headers);
    print(response.body);
  }
}
