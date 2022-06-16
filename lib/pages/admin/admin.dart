import 'package:flutter/material.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';

class AdminHomePage extends StatelessWidget {
  final String title = 'Admin Home Page';
  final String? username;

  AdminHomePage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
          text: "Admin Page: " + username!,
          color: Colors.black,
          size: 30,
          weight: FontWeight.bold),
    );
  }
}
