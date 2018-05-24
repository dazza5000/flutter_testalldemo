import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtils {
// next three lines makes this class a Singleton
  static NetworkUtils _instance = new NetworkUtils.internal();

  NetworkUtils.internal();

  factory NetworkUtils() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url, {Map header}) {
    return http
        .get(url, headers: header)
        .then
      ((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    return http.post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}