import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://www.creativefabrica.com/wp-content/uploads/2022/07/13/forgot-password-Icon-Illustration-vector-Graphics-34103199-1.jpg',
              height: 30 * AppUI.dh,
              width: 100 * AppUI.dw,
            ),
            Text(
              'Reset password',
              style: TextStyle(
                fontSize: 16 * AppUI.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please enter the email address linked to your account. we\'ll send you a new password.',
              style: TextStyle(
                fontSize: 10 * AppUI.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Enter your email',
                ),
              ),
            ),
            SizedBox(
              height: 6 * AppUI.dh,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.green,
                      content: Text(
                        'Please check your email.',
                        style: TextStyle(
                          fontSize: 12 * AppUI.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.active,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 15 * AppUI.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
