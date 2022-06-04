import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycvfull_app/constants/style.dart';
import 'package:mycvfull_app/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = SobrePageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case HomePageRoute:
        return _customIcon(Icons.home, itemName);
      case FormacaoPageRoute:
        return _customIcon(Icons.auto_stories, itemName);
      case ExperienciaPageRoute:
        return _customIcon(Icons.business_center, itemName);
      case CurriculoPageRoute:
        return _customIcon(Icons.border_color, itemName);
      case ContatoPageRoute:
        return _customIcon(Icons.phone, itemName);
      case SobrePageRoute:
        return _customIcon(Icons.badge, itemName);
      case LoginPageRoute:
        return _customIcon(Icons.login, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: dark,
      );

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
