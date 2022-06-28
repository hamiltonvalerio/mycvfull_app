import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mycvfull_app/models/api_response.dart';
import 'package:mycvfull_app/services/session_storage_service.dart';

class RestApiService {
  static RestApiService? service;

  static Future<RestApiService?> getInstance() async {
    if (service == null) {
      service = RestApiService();
    }
    return service;
  }

  Future<ApiResponse<T>> apiGetSecured<T>(
      Uri uri, T Function(Map<String, dynamic>) fromJson) async {
    print("aqui");
    final headers = await createAuthHeader();
    if (headers == null) {
      return ApiResponse<T>(body: null, code: 401);
    }
    print(headers);
    final response = await http.get(uri, headers: headers);
    print("RESPONSE");
    print(response.body);
    return parseResponse(response, fromJson);
  }

  Future<Object> apiGetSecuredString<T>(
      Uri uri, T Function(Map<String, dynamic>) fromJson) async {
    final headers = await createAuthHeader();
    if (headers == null) {
      return ApiResponse<T>(body: null, code: 401);
    }
    print(headers);
    final response = await http.get(uri, headers: headers);
    return response.body;
  }

  Future<ApiResponse<T>> apiGetNotSecured<T>(
      Uri uri, T Function(Map<String, dynamic>) fromJson) async {
    final response = await http.get(uri);
    return parseResponse(response, fromJson);
  }

  ApiResponse<T> parseResponse<T>(
      Response response, T Function(Map<String, dynamic>) fromJson) {
    if (response.statusCode == 200) {
      final parsedBody = deserialize<T>(response.body, (x) => fromJson(x));
      return ApiResponse<T>(body: parsedBody, code: response.statusCode);
    } else {
      final requestFailedMsg =
          "Failed to fetch data from: ${response.request?.url}";
      debugPrint(requestFailedMsg);
      return ApiResponse<T>(body: null, code: response.statusCode);
    }
  }

  T deserialize<T>(
    String json,
    T factory(Map<String, dynamic> data),
  ) {
    return factory(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<Map<String, String>?> createAuthHeader() async {
    var sessionStorageService = await SessionStorageService.getInstance();
    var accessToken = sessionStorageService?.retriveAccessToken();
    if (accessToken == null) {
      debugPrint("No access token in local storage found. Please log in.");
      return null;
    }
    return {"Authorization": "Bearer $accessToken"};
  }
}
