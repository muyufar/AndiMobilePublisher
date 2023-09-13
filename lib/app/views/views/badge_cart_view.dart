import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ionicons/ionicons.dart';

/// BadgeCartView
///
/// This class is a widget that displays a badge with the number of items in the cart.

/// Properties
///
/// * `color`: The color of the badge.

/// Usage
///
/// To use this class, you first need to import it. Then, you can use it to display a badge with the number of items in the cart like this:
///
///
/// BadgeCartView(color: Colors.red);
///
/// This code will create a badge with the number of items in the cart and the color red.

class BadgeCartView extends GetView {
  final Color color;
  BadgeCartView({this.color = Colors.white, Key? key}) : super(key: key);

  @override
  final UtilsController controller = Get.put(UtilsController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CART),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Center(
          child: Obx(
            () => badges.Badge(
              onTap: () {},
              badgeAnimation: const badges.BadgeAnimation.slide(
                disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
              ),
              position: badges.BadgePosition.topEnd(top: -14, end: -10),
              showBadge: controller.countCart.value != '0',
              badgeContent: Text(
                controller.countCart.value,
                style: TextStyle(
                    fontSize: (controller.countCart.value.length <= 1)
                        ? 14
                        : (controller.countCart.value.length <= 2)
                            ? 10
                            : (controller.countCart.value.length <= 3)
                                ? 8
                                : null,
                    color: Colors.white),
              ),
              child: Icon(
                Ionicons.cart_outline,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
