import 'dart:collection';
import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../model/mapPageModel.dart';
import '../viewmodel/map__page_view_model.dart';

abstract class MapPageInterface {
  void setAnnotations();
  void setLoading(bool isLoading);
}

class MapPage extends StatefulWidget implements MapPageInterface {
  MapPageViewModel viewModel = MapPageViewModel();

  GoogleMapController _controller;
  _MapPage mapPage = _MapPage();

  MapPage() {
    //viewModel.view = this;
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
    viewModel.getAllAnnouncements();
    print(viewModel.deneme);
    //mapPage.setAnnotations(viewModel.annotations);
  }

  @override
  void setLoading(bool isLoading) {
    // TODO: implement setLoading
  }
}

class _MapPage extends BaseState<MapPage> {
  Set<Marker> _annotations = HashSet<Marker>();
  var iconsMap = Map<MapPageTypes, BitmapDescriptor>();
  Location location = new Location();
  bool showInfoCard = false;
  bool showInfoCardDetail = false;
  AlignmentGeometry _alignment = Alignment(0, 2);
  MapPageModel selectedAnnotationData = MapPageModel(
      "12345",
      "Title",
      "https://lh3.googleusercontent.com/proxy/OeeFLvXMk1IGUA2DCnlf5hHYnFLHE-8J8f19a5EuauXccW3DDKHYQ68NHo55ikdADiJxCgAuBK1ROwFd7AstlMtfM78-2j2i3KBAsrkcxfsOtBCx6yWE69ZOKWOd",
      "desc",
      "17.09.2020",
      12.7,
      "Bekliyor",
      36.00,
      30.704044,
      MapPageTypes.FOOD); // TODO this must remove, find any solution

  @override
  void initState() {
    _setAnnotationIcon();

    super.initState();
  }

  void setAnnotations(List<MapPageModel> annotations) {
    for (var annotation in annotations) {
      setState(() {
        _annotations.add(
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
    widget.loadData();
    _loadLocation();
  }

  void _setAnnotationIcon() async {
    iconsMap[MapPageTypes.FOOD] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/beach.png");

    iconsMap[MapPageTypes.LOST] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/beach.png");

    iconsMap[MapPageTypes.OWNERSHIP] = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/beach.png");
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
        widget._controller.animateCamera(CameraUpdate.newLatLng(
            LatLng(currentLocation.latitude, currentLocation.longitude)));
      });
    });

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        widget._controller.animateCamera(CameraUpdate.newLatLng(
            LatLng(currentLocation.latitude, currentLocation.longitude)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    fit: BoxFit.cover, image: NetworkImage("asdasd"))),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "asdas",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(selectedAnnotationData.distance.toString() + "km"),
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
    return GoogleMap(
        onTap: (_) {
          setState(() {
            showInfoCard = false;
            _alignment = showInfoCard ? Alignment(0, 1) : Alignment(0, 2);
            showInfoCardDetail = false;
          });
        },
        onMapCreated: _onMapCreated,
        markers: _annotations,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition:
            CameraPosition(target: LatLng(36.88000, 30.704044), zoom: 12));
  }
}
