import 'package:flutter/material.dart';
import 'package:mycvfull_app/helpers/local_navigator.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
        color: Colors.white,
      )),
      Expanded(flex: 5, child: localNavigator()),
      Expanded(
          child: Container(
        color: Colors.white,
      )),
    ]);
  }
}
