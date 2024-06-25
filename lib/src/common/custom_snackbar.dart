import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
//

  static showSnackbar({required String msg, Color bgColor = AppColors.green}) {
    return ScaffoldMessenger.of(Navigation.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          msg,
          style: TextStyle(
            fontSize: 12 * AppUI.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
