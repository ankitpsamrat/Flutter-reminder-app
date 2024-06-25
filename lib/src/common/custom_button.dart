import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.title,
    this.bgColor = AppColors.blue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6 * AppUI.dh,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          foregroundColor: AppColors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15 * AppUI.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
