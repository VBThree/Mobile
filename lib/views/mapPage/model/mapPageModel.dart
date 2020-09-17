import 'dart:wasm';

class MapPageModel {
  String name;
  String imageUrl;
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
      this.name,
      this.imageUrl,
      this.description,
      this.date,
      this.distance,
      this.status,
      this.latitude,
      this.longitude,
      this.type);
}

enum MapPageTypes { FOOD, VACCINATION,OWNERSHIP,LOST }
