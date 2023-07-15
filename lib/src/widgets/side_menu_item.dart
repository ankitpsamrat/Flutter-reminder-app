import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/widgets/horizontal_menu_item_copy.dart';
import 'package:desktop_application/src/widgets/vertical_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;

  const SideMenuItem({
    required this.itemName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context)) {
      return VertticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    } else {
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
  }
}
