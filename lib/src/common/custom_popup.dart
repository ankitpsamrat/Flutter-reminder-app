import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustomPopUp extends StatelessWidget {
  const CustomPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Are you sure to delete this reminder!'),
      titleTextStyle: TextStyle(
        fontSize: 14 * AppUI.sp,
        color: AppColors.black,
      ),
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigation.navigatorKey.currentState!.pop();
              },
              child: Text(
                'No',
                style: TextStyle(fontSize: 12 * AppUI.sp),
              ),
            ),
            SizedBox(width: 8 * AppUI.dw),
            ElevatedButton(
              onPressed: () {
                Navigation.navigatorKey.currentState!.pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
              ),
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 12 * AppUI.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
