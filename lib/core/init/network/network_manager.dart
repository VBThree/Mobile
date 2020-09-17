import 'package:http/http.dart' as http;

class NetworkManager {
  static NetworkManager _instance;

  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager.init();
    return _instance;
  }

  NetworkManager.init();

  final baseUrl = 'http://161.35.73.226/graphql';

  final client = http.Client();

  final getAllAnnouncementsQuery = {
    "query":
        "{\n  announcements{\n    createdBy{\n      id\n      name\n    }\n    date\n    type\n    species\n    gender\n    breed\n    age\n    description\n    status\n    attendant{\n      id\n      name\n    }\n    coordinates\n    photo\n  }\n}"
  };

  Future<http.Response> getAnnouncements() async {
    var response = await client.post(baseUrl, body: getAllAnnouncementsQuery);

    return response;
  }
}
