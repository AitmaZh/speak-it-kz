import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseUrl = 'http://localhost:3000';
  // String baseUrl = 'http://10.0.2.2/api'; 
  // String baseUrl = 'http://0.0.0.0/api';
  var log = Logger();

  Future get(String url) async {
    url = formater(url);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }

    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formater(url);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.d(response.body);
    log.d(response.statusCode);
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
