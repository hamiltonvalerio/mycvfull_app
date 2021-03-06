import 'package:flutter_flavor/flutter_flavor.dart';

class Environment {
  static final String CLIENT_ID = "frontend-service";
  static final String SSO_URL = "http://localhost:8888/auth/realms/mycvfullapp";
  static final Map<String, String> HEADER = {
    "content-type": "application/x-www-form-urlencoded",
    "cache-control": "no-cache",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  };
  static final String BASE_KEYCLOAK_USL = "http://localhost:8888";
  static final String BASE_API_URL = "http://localhost:8080";
}
