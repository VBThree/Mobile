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

  Future<http.Response> postGraphqlQuery(String body, Map headers) async {
    var response = await client.post(
      baseUrl,
      body: body,
      headers: headers,
    );

    return response;
  }
}
