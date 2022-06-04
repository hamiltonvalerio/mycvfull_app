import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycvfull_app/constants/controllers.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/widgets/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(
                    width: 3,
                    height: 72,
                    color: dark,
                  ),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName),
                      ),
                      if (!menuController.isActive(itemName))
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName)
                              ? dark
                              : lightGrey,
                          size: 18,
                          weight: FontWeight.bold,
                        ))
                      else
                        Flexible(
                            child: CustomText(
                          text: itemName,
                          color: dark,
                          size: 18,
                          weight: FontWeight.bold,
                        ))
                    ],
                  ),
                ))
              ]),
            )));
  }
}
