import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mycvfull_app/constants/controllers.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/helpers/responsiveness.dart';
import 'package:mycvfull_app/pages/contato/contato.dart';
import 'package:mycvfull_app/pages/curriculo/curriculo.dart';
import 'package:mycvfull_app/pages/experiencia/experiencia.dart';
import 'package:mycvfull_app/pages/formacao/formacao.dart';
import 'package:mycvfull_app/pages/home/home.dart';
import 'package:mycvfull_app/pages/login/login.dart';
import 'package:mycvfull_app/pages/sobre/sobre.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: Row(
        children: [
          !ResponsiveWidget.isSmallScreen(context)
              ? Visibility(
                  child: CustomText(
                  text: "  valerio.eti.br",
                  color: lightGrey,
                  size: 20,
                  weight: FontWeight.normal,
                ))
              : IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    key.currentState?.openDrawer();
                  },
                ),
        ],
      ),
      leadingWidth: 130,
      title: Container(
        child: Row(
          children: [
            Expanded(child: Container()),
            !ResponsiveWidget.isSmallScreen(context)
                ? Row(
                    children: [
                      TextButton(
                          child: Text('Home'),
                          onPressed: () {
                            navigationController
                                .navigateTo(HomePage().getNameRoute());
                          }),
                      TextButton(
                          child: Text('Formação'),
                          onPressed: () {
                            navigationController
                                .navigateTo(FormacaoPage().getNameRoute());
                          }),
                      TextButton(
                          child: Text('Experiência'),
                          onPressed: () {
                            navigationController
                                .navigateTo(ExperienciaPage().getNameRoute());
                          }),
                      TextButton(
                          child: Text('Cúrriculo'),
                          onPressed: () {
                            navigationController
                                .navigateTo(CurriculoPage().getNameRoute());
                          }),
                      TextButton(
                          child: Text('Contatos'),
                          onPressed: () {
                            navigationController
                                .navigateTo(ContatoPage().getNameRoute());
                          }),
                      TextButton(
                          child: Text('Sobre'),
                          onPressed: () {
                            navigationController
                                .navigateTo(SobrePage().getNameRoute());
                          }),
                    ],
                  )
                : Row(),
            IconButton(
              icon: Image.asset(
                  "assets/icons/linkedin/icons8-linkedin-circled-32.png"),
              iconSize: 32,
              onPressed: () {
                _launch(
                    Uri.parse("https://www.linkedin.com/in/hamiltonvalerio"));
              },
            ),
            IconButton(
              icon: Image.asset("assets/icons/github/icons8-github-32.png"),
              iconSize: 32,
              onPressed: () {
                _launch(Uri.parse("https://github.com/hamiltonvalerio"));
              },
            ),
            IconButton(
              icon:
                  Image.asset("assets/icons/instagram/icons8-instagram-32.png"),
              iconSize: 32,
              onPressed: () {
                _launch(Uri.parse(
                    "https://www.instagram.com/hamiltonvaleriofilho/"));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: dark.withOpacity(.7),
              ),
              onPressed: () {
                navigationController.navigateTo(LoginPage().getNameRoute());
              },
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

Future<void> _launch(Uri url) async {
  await canLaunchUrl(url)
      ? await launchUrl(url)
      : throw 'Could not launch $url';
}
