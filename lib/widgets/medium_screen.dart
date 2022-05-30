import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
        color: Colors.yellow,
      )),
      Expanded(
        flex: 4,
        child: Container(
          color: Colors.brown,
        ),
      ),
      Expanded(
          child: Container(
        color: Colors.yellow,
      )),
    ]);
  }
}
