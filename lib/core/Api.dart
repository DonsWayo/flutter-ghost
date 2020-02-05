import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "/ghost/api/v3/admin/";

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

  static postAllRequest(String url, body) async {
    var domain = await getOrigin();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Origin': domain
    };
    try {
      var response = await Requests.post(domain + baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      print(response.content());
      return response;
    } catch (e) {
      print(e);
    }
  }

  static putAllRequest(String url, body) async {
    var domain = await getOrigin();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Origin': domain
    };
    try {
      var response = await Requests.put(domain + baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      print(response.content());
      return response;
    } catch (e) {
      print(e);
    }
  }

  static postPostRequest(String url, body) async {
    var domain = await getOrigin();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Origin': domain
    };
    try {
      var response = await Requests.post(domain + baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      print(response.content());
      return response;
    } catch (e) {
      print(e);
    }
  }

  static uploadImage(body) async {
    var domain = await getOrigin();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Origin': domain
    };
    try {
      var response = await Requests.post(domain  + baseUrl + 'admin/images/upload',
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      print(response.content());
      return response;
    } catch (e) {
      print(e);
    }
  }

  static postLoginRequest(String url, headers, body, website) async {
      var domain = await getOrigin();
    try {
      var response = await Requests.post(domain + baseUrl + url,
          headers: headers, body: body, bodyEncoding: RequestBodyEncoding.JSON);
      if (response.success) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('HeaderKey', website);
        sharedPreferences.setBool('remember', true);
      }
      return response.success;
    } catch (e) {
      print(e);
    }
  }

  static getAllRequest(String url) async {
    var domain = await getOrigin();
    Map<String, String> headers = {'Origin': domain};
    try {
      var response = await Requests.get(domain + baseUrl + url, headers: headers);
      print(response);
      if (response.success) {
        return response.content();
      }
    } catch (e) {
      print(e);
    }
  }

  static getOrigin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('HeaderKey')) {
      return sharedPreferences.getString('HeaderKey');
    } else {
      return null;
    }
  }
}
