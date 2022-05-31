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
                      width: 28,
                    ))
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
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
                        child: Text('Sobre'),
                        onPressed: () {
                          print('Pressed');
                        }),
                  ],
                )
              : Row(),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
            onPressed: () {},
          ),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          SizedBox(
            width: 24,
          ),
          CustomText(
            text: "Hamilton Valério",
            size: 12,
            color: lightGrey,
            weight: FontWeight.normal,
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(
                    Icons.person_outline,
                    color: dark,
                  )),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
