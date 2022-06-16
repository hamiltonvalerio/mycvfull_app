class Environment {
  static final String CLIENT_ID = "backend-service";
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
}
