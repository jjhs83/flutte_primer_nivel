import 'dart:convert';
import 'package:final_project/src/common/constants.dart';
import 'package:final_project/src/shared_preferences/user_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  String _url = getFitbitUrl();
  Future<bool> login() async {
    bool response = false;
    final url = Uri.https(this._url, "/api/login");
    UserPreferences _prefs = UserPreferences();
    try {
      final result = await http.post(url,
          body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});

      response = true;
      Map<String, dynamic> responseData = {};
      responseData = jsonDecode(result.body);
      print(responseData['token']);
      _prefs.token = responseData['token'];
      _prefs.userId = "2";
    } on PlatformException catch (e) {
      print(e);
    }
    return response;
  }
}
