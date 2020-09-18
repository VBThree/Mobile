import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkManager {
  static NetworkManager _instance;

  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager.init();
    return _instance;
  }

  NetworkManager.init();

  final baseUrl = 'http://161.35.73.226/graphql';

  final client = http.Client();

  Future<String> getLocaleStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(key);
    return data;
  }

  Future<void> setLocaleStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<http.Response> postGraphqlQuery(String body, Map headers) async {
    var response = await client.post(
      baseUrl,
      body: body,
      headers: headers,
    );

    return response;
  }
}
