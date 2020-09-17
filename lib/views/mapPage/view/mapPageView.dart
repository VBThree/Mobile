import 'dart:collection';
import 'dart:convert';
import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:VBThreeMobile/core/base/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../model/mapPageModel.dart';
import '../viewmodel/map__page_view_model.dart';

abstract class MapPageInterface {
  void setAnnotations();
  void setLoading(bool isLoading);
}

MapPageViewModel viewModel = MapPageViewModel();

class MapPage extends StatefulWidget implements MapPageInterface {
  GoogleMapController _controller;
  _MapPage mapPage = _MapPage();

  MapPage() {
    viewModel.page = this;
  }

  @override
  State<StatefulWidget> createState() {
    return mapPage;
  }

  void loadData() {
    setAnnotations();
  }

  MapPageModel selectData(String uuid) {
    return viewModel.selectPoint(uuid);
  }

  @override
  void setAnnotations() {
    mapPage.setAnnotations();
  }

  @override
  void setLoading(bool isLoading) {
    // TODO: implement setLoading
  }
}

class _MapPage extends BaseState<MapPage> {
  var iconsMap = Map<MapPageTypes, BitmapDescriptor>();
  Location location = new Location();
  LatLng currentLocationData = LatLng(1.0, 1.0);
  bool showInfoCard = false;
  bool showInfoCardDetail = false;
  AlignmentGeometry _alignment = Alignment(0, 2);
  MapPageModel selectedAnnotationData = MapPageModel(
      "",
      "",
      "https://cdn.icon-icons.com/icons2/2108/PNG/512/flutter_icon_130936.png",
      "",
      "",
      "",
      1.0,
      1.0,
      MapPageTypes.FOOD); // TODO this must remove, find any solution

  @override
  void initState() {
    _setAnnotationIcon();
    viewModel.getAllAnnouncements();

    super.initState();
  }

  void setAnnotations() {
    for (var annotation in viewModel.annotations) {
      print("ads");
      print(annotation);
      setState(() {
        viewModel.annotationsMarkers.add(
          Marker(
              markerId: MarkerId(annotation.uuid),
              position: LatLng(annotation.latitude, annotation.longitude),
              onTap: () {
                setState(() {
                  selectedAnnotationData = widget.selectData(annotation.uuid);
                  showInfoCard = !showInfoCard;
                  _alignment = showInfoCard ? Alignment(0, 1) : Alignment(0, 2);
                  showInfoCardDetail = false;
                });
              },
              icon: iconsMap[annotation.type]),
        );
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    widget._controller = controller;

    _loadLocation();
  }

  void _setAnnotationIcon() async {
    iconsMap[MapPageTypes.FOOD] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/mapImage/Food.png");

    iconsMap[MapPageTypes.LOST] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/mapImage/Lost.png");

    iconsMap[MapPageTypes.OWNERSHIP] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/mapImage/Ownership.png");

    iconsMap[MapPageTypes.VACCINATION] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/mapImage/Vaccination.png");
  }

// maybe generic?
  void _loadLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await location.getLocation().then((currentLocation) {
      setState(() {
        currentLocationData =
            LatLng(currentLocation.latitude, currentLocation.longitude);
        widget._controller
            .animateCamera(CameraUpdate.newLatLng(currentLocationData));
      });
    });

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        currentLocationData =
            LatLng(currentLocation.latitude, currentLocation.longitude);
        widget._controller
            .animateCamera(CameraUpdate.newLatLng(currentLocationData));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        onPageBuilder: (context, value) => viewModel.annotationsMarkers.isEmpty
            ? CircularProgressIndicator()
            : buildScaffold(),
        viewModel: viewModel,
        onModelReady: (model) {
          viewModel = model;
        });
  }

  Scaffold buildScaffold() {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !showInfoCard,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
        ),
      ),
      body: Container(
        child: Stack(
          children: [buildGoogleMap(), detailWidget()],
        ),
      ),
    );
  }

  AnimatedAlign detailWidget() {
    return AnimatedAlign(
      alignment: _alignment,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
      child: Container(
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showInfoCardDetail = true;
              });
            },
            child: detailCardWidget(),
          ),
        ),
      ),
    );
  }

  Card detailCardWidget() {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [detailCardBodywidget(), detailCardInfoWidget()],
      ),
    );
  }

  Visibility detailCardInfoWidget() {
    return Visibility(
      visible: showInfoCardDetail,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(selectedAnnotationData.description),
      ),
    );
  }

  Row detailCardBodywidget() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(selectedAnnotationData.imageURL),
                )),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedAnnotationData.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(viewModel
                .getDistanceFromGPSPointsInRoute(
                    LatLng(selectedAnnotationData.latitude,
                        selectedAnnotationData.longitude),
                    currentLocationData)
                .toString()),
            Text(selectedAnnotationData.date),
            Text(selectedAnnotationData.status)
          ],
        ),
        Spacer(),
        Container(
          margin: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.directions_run, color: Colors.white),
          ),
        ),
      ],
    );
  }

  GoogleMap buildGoogleMap() {
    print("Neler");
    print(viewModel.annotationsMarkers);
    return GoogleMap(
        onTap: (_) {
          setState(() {
            showInfoCard = false;
            _alignment = showInfoCard ? Alignment(0, 1) : Alignment(0, 2);
            showInfoCardDetail = false;
          });
        },
        onMapCreated: _onMapCreated,
        markers: viewModel.annotationsMarkers,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition:
            CameraPosition(target: LatLng(36.88000, 30.704044), zoom: 12));
  }
}
