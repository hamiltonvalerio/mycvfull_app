import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';

class FormacaoPage extends StatelessWidget {
  const FormacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
          text: "Formacao Page",
          color: Colors.black,
          size: 30,
          weight: FontWeight.bold),
    );
  }

  getNameRoute() => "Formação";
}
