import 'package:flutter/material.dart';
import 'package:mycvfull_app/models/api_response.dart';
import 'package:mycvfull_app/models/server_message.dart';
import 'package:mycvfull_app/services/rest-api-service.dart';
import 'package:mycvfull_app/utils/env.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';

class AdminHomePage extends StatelessWidget {
  final String title = 'Admin Home Page';
  final String? username;

  AdminHomePage({Key? key, this.username}) : super(key: key);

  Future<Object?> acessarApi(Uri uri) async {
    var restApiService = await RestApiService.getInstance();
    final response = await restApiService?.apiGetSecuredString<ServerMessage>(
        uri, (json) => ServerMessage.fromJson(json));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
              text: "Admin Page: " + username!,
              color: Colors.black,
              size: 30,
              weight: FontWeight.bold),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () async {
              var teste = await acessarApi(
                  Uri.parse(Environment.BASE_API_URL + "/hello/oi"));
              print("teste.toString()");
              print(teste.toString());
            },
            child: Text('BACKEND REST'),
          )
        ],
      ),
    );
  }
}
