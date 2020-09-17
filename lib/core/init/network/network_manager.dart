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

  final postLoginDataQuery = {
    {
      "query":
          "mutation{\n  login(email:\"ahmet@mail.com\", password:\"1234\")\n}"
    }
  };

  final getUserDataQuery = {
    "query":
        "{\n  me{\n    id\n    name\n    email\n    phone\n    birthday\n    rating\n    publishedCount\n    resolvedCount\n    photo\n  }\n}"
  };

  final postRegisterDataQuery = {
    "query":
        "mutation{\n  register(\n    name:\"dasdas\"\n    email:\"dasdfdfas@fjsdjfdsasd.com\"\n    password:\"1234\"\n\t\tphone:\"43233243432\"\n    birthday:\"2000-11-05T06:30:00.000Z\"\n    rating:1.2\n    photo:\"\"\n  )\n}\n\n# {\n#   users{\n#     birthday\n#   }\n# }"
  };
  Future<http.Response> getAnnouncements() async {
    var response = await client.post(baseUrl, body: getAllAnnouncementsQuery);

    return response;
  }

  Future<http.Response> postLoginData() async {
    var response = await client.post(baseUrl, body: postLoginDataQuery);

    return response;
  }

  Future<http.Response> postRegisterData() async {
    var response = await client.post(baseUrl, body: postRegisterDataQuery);

    return response;
  }

  Future<http.Response> getUserData() async {
    var response = await client.post(baseUrl, body: getUserDataQuery, headers: {
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmNjFiZmQ1ZTBlNTQ5MTJjNTE0M2VjMiIsImlhdCI6MTYwMDM0NTI2MSwiZXhwIjoxNjMxOTAyODYxfQ._VmUw581XSFrxt8Xt4JqVetKWnfrS5yusc_E0H7UVb8"
    });

    return response;
  }
}
