import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/helpers/responsiveness.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 14),
                    child: Image.asset(
                      "assets/icons/logo.png",
                      width: 32,
                    ))
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              },
            ),
      title: Container(
        child: Row(
          children: [
            Visibility(
                child: CustomText(
              text: "valerio.eti.br",
              color: lightGrey,
              size: 20,
              weight: FontWeight.normal,
            )),
            Expanded(child: Container()),
            !ResponsiveWidget.isSmallScreen(context)
                ? Row(
                    children: [
                      TextButton(
                          child: Text('Home'),
                          onPressed: () {
                            print('Pressed');
                          }),
                      TextButton(
                          child: Text('Formação'),
                          onPressed: () {
                            print('Pressed');
                          }),
                      TextButton(
                          child: Text('Experiência'),
                          onPressed: () {
                            print('Pressed');
                          }),
                      TextButton(
                          child: Text('Cúrriculo'),
                          onPressed: () {
                            print('Pressed');
                          }),
                      TextButton(
                          child: Text('Contatos'),
                          onPressed: () {
                            print('Pressed');
                          }),
                      TextButton(
                          child: Text('Sobre'),
                          onPressed: () {
                            print('Pressed');
                          }),
                    ],
                  )
                : Row(),
            IconButton(
              icon: Image.asset(
                  "assets/icons/linkedin/icons8-linkedin-circled-32.png"),
              iconSize: 32,
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset("assets/icons/github/icons8-github-32.png"),
              iconSize: 32,
              onPressed: () {},
            ),
            IconButton(
              icon:
                  Image.asset("assets/icons/instagram/icons8-instagram-32.png"),
              iconSize: 32,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: dark.withOpacity(.7),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
