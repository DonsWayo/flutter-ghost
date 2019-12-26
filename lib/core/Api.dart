import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';

const baseUrl = "https://deviffy.com/ghost/api/v3/admin/";

class Api {
  static Future<dynamic> getRequest(String url, Map headers) {
    return http
        .get(baseUrl + url, headers: headers)
        .then((http.Response response) {
      final res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return res;
    });
  }

  static Future<dynamic> postRequest(String url, {headers, body}) {
    return http
        .post(baseUrl + url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print(response.body);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return res;
    });
  }

  static postAllRequest(String url, headers, body) async {
    try {
      var response = await Requests.post(baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      print(response.content());
      return response;
    } catch (e) {
      print(e);
    }
  }

  static postLoginRequest(String url, headers, body) async {
    try {
      var response = await Requests.post(baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      return response.success;
    } catch (e) {
      print(e);
    }
  }

  static getAllRequest(String url, headers) async {
    try {
      var response = await Requests.get(baseUrl + url, headers: headers);
      print(response);
      if (response.success) {
        return response.content();
      }
    } catch (e) {
      print(e);
    }
  }
}
