import 'package:flutter/material.dart';
import 'package:mycvfull_app/services/session_storage_service.dart';
import 'package:mycvfull_app/utils/env.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static AuthService? service;

  static Future<AuthService?> getInstance() async {
    if (service == null) {
      service = AuthService();
    }
    return service;
  }

  Future<int> authenticateUser(String username, String password) async {
    String url = Environment.SSO_URL + "/protocol/openid-connect/token";

    Map<String, String> data = {
      "client_id": Environment.CLIENT_ID,
      "username": username,
      "password": password,
      "grant_type": 'password'
    };

    var res = await http.post(Uri.parse(url),
        headers: Environment.HEADER, body: data);

    if (res.statusCode == 200) {
      var sessionStorageService = await SessionStorageService.getInstance();
      sessionStorageService?.saveAccessToken(res.body);
      return res.statusCode;
    } else {
      debugPrint(
          "Erro no login. Status code: ${res.statusCode} , body: ${res.body.toString()}");
      return res.statusCode;
    }
  }
}
