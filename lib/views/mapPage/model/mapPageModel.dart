import 'dart:wasm';

class MapPageModel {
  String title;
  String imageURL;
  String description;
  double latitude;
  double longitude;
  double distance;
  String status;
  String date;
  String uuid;
  MapPageTypes type;

  MapPageModel(
      this.uuid,
      this.title,
      this.imageURL,
      this.description,
      this.date,
      this.distance,
      this.status,
      this.latitude,
      this.longitude,
      this.type);
}

enum MapPageTypes { value1, value2, value3 }
