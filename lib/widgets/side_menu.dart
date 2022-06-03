import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycvfull_app/constants/controllers.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/helpers/responsiveness.dart';
import 'package:mycvfull_app/routing/routes.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';
import 'package:mycvfull_app/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "valerio.eti.br",
                      size: 14,
                      weight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? "Log Out"
                        : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        //TODO:: GO TO AUTHENTICATION PAGE
                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveitemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        //TODO:: GO TO ITEN NAME ROUTE
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
