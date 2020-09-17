import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:VBThreeMobile/views/mapPage/model/mapPageModel.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';

part 'map__page_view_model.g.dart';

class MapPageViewModel = _MapPageViewModelBase with _$MapPageViewModel;

abstract class _MapPageViewModelBase with Store {
  List<MapPageModel> annotations;
  String deneme;
  @action
  MapPageModel selectPoint(String uuid) {
    return annotations.where((item) => item.uuid == uuid).first;
  }

  @action
  void updateStatus(String uuid) {
    // TODO: implement updateStatus
  }

  Future<void> getAllAnnouncements() async {
    Response response = await NetworkManager.instance.getAnnouncements();
    deneme = response.body;

    
    print(deneme + " viewmodel içi");
  }
}
