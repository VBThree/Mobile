import 'dart:wasm';

class MapPageModel {
  String name;
  String imageURL;
  String description;
  double latitude;
  double longitude;
  String status;
  String date;
  String uuid;
  MapPageTypes type;

  MapPageModel(this.uuid, this.name, this.imageURL, this.description, this.date,
      this.status, this.latitude, this.longitude, this.type);
}

enum MapPageTypes { FOOD, VACCINATION, OWNERSHIP, LOST }

class AnnouncementsApiResponse {
  AnnouncementsApiData data;

  AnnouncementsApiResponse({this.data});

  AnnouncementsApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new AnnouncementsApiData.fromJson(json['data'])
        : null;
  }
}

class AnnouncementsApiData {
  List<Announcements> announcements;

  AnnouncementsApiData({this.announcements});

  AnnouncementsApiData.fromJson(Map<String, dynamic> json) {
    if (json['announcements'] != null) {
      announcements = new List<Announcements>();
      json['announcements'].forEach((v) {
        announcements.add(new Announcements.fromJson(v));
      });
    }
  }
}

class Announcements {
  CreatedBy createdBy;
  String date;
  String type;
  String species;
  String gender;
  String breed;
  int age;
  String description;
  String status;
  Null attendant;
  List<double> coordinates;
  List<String> photo;

  Announcements(
      {this.createdBy,
      this.date,
      this.type,
      this.species,
      this.gender,
      this.breed,
      this.age,
      this.description,
      this.status,
      this.attendant,
      this.coordinates,
      this.photo});

  Announcements.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    date = json['date'];
    type = json['type'];
    species = json['species'];
    gender = json['gender'];
    breed = json['breed'];
    age = json['age'];
    description = json['description'];
    status = json['status'];
    attendant = json['attendant'];
    coordinates = json['coordinates'].cast<double>();

    photo = new List<String>();
    json['photo'].forEach((v) {
      photo.add(v);
    });
  }
}

class CreatedBy {
  String id;
  Null name;

  CreatedBy({this.id, this.name});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
