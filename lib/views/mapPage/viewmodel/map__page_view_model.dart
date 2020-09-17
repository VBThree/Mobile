import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:VBThreeMobile/core/init/network/network_manager.dart';
import 'package:VBThreeMobile/views/mapPage/model/mapPageModel.dart';
import 'package:VBThreeMobile/views/mapPage/view/mapPageView.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart';

part 'map__page_view_model.g.dart';

class MapPageViewModel = _MapPageViewModelBase with _$MapPageViewModel;

abstract class _MapPageViewModelBase with Store {
  @observable
  ObservableList<MapPageModel> annotations =
      List<MapPageModel>().asObservable();

  @action
  MapPageModel selectPoint(String uuid) {
    return annotations.where((item) => item.uuid == uuid).first;
  }

  @action
  void updateStatus(String uuid) {
    // TODO: implement updateStatus
  }
  MapPage page;
  @observable
  Set<Marker> annotationsMarkers = HashSet<Marker>();

  Future<void> getAllAnnouncements() async {
    String query = """
       {
         announcements{
           createdBy{
             id
             name
           }
           date
           type
           species
           gender
           breed
           age
           description
           status
           attendant{
             id
             name
           }
           coordinates
           photo
         }
       } """;
    Map<String, String> headers = {"Content-Type": "application/graphql"};

    Response response = await NetworkManager.instance.postGraphqlQuery(
      query,
      headers,
    );

    Map<String, dynamic> data = jsonDecode(response.body);
    var result = AnnouncementsApiResponse.fromJson(data);

    for (var data in result.data.announcements) {
      MapPageTypes type = MapPageTypes.OWNERSHIP;

      if (data.type == "Ownership") {
        type = MapPageTypes.OWNERSHIP;
      } else if (data.type == "Lost") {
        type = MapPageTypes.LOST;
      } else if (data.type == "Food") {
        type = MapPageTypes.FOOD;
      } else if (data.type == "Vaccination") {
        type = MapPageTypes.VACCINATION;
      }
      annotations.add(MapPageModel(
        data.createdBy.id ?? "",
        data.createdBy.name ?? "",
        data.photo.length > 0 ? data.photo.first : "",
        data.description ?? "",
        data.date ?? "",
        data.status ?? "",
        data.coordinates.length == 2 ? data.coordinates.last : 0.0,
        data.coordinates.length == 2 ? data.coordinates.first : 0.0,
        type,
      ));
    }
    page.setAnnotations();
  }

  double getDistanceFromGPSPointsInRoute(LatLng c1, LatLng c2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((c2.latitude - c1.latitude * p) / 2 +
            c(c1.latitude * p) *
                c(c2.latitude * p) *
                (1 - c((c2.longitude - c1.longitude) * p)) /
                2);
    return 12742 * asin(sqrt(a));
  }
}
