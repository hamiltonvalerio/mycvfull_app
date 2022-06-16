class ApiResponse<T> {
  final T? body;
  final int code;

  ApiResponse({this.body, required this.code});
}
