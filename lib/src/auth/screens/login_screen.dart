import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/auth/screens/forgot_password.dart';
import 'package:desktop_application/src/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12 * AppUI.dh,
                bottom: 6 * AppUI.dh,
              ),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/6028/6028690.png',
                height: 30 * AppUI.dh,
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 12 * AppUI.sp),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                hintText: 'Enter your email',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Enter your password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigation.navigatorKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                );
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 12 * AppUI.sp,
                  color: AppColors.active,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 6 * AppUI.dh,
              width: double.infinity,
              margin: EdgeInsets.only(top: 6 * AppUI.dh, bottom: 2 * AppUI.dh),
              child: ElevatedButton(
                onPressed: () {
                  Navigation.navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.active,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 15 * AppUI.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // RichText(
            //   text: TextSpan(
            //     style: TextStyle(
            //       fontSize: 12 * AppUI.sp,
            //       color: AppColors.black,
            //       fontWeight: FontWeight.w600,
            //     ),
            //     children: [
            //       const TextSpan(text: 'Don\'t have an account?  '),
            //       TextSpan(
            //         text: 'Sign up',
            //         style: const TextStyle(
            //           color: AppColors.active,
            //           decoration: TextDecoration.underline,
            //           decorationColor: AppColors.active,
            //         ),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             Navigation.navigatorKey.currentState!.push(
            //               MaterialPageRoute(
            //                 builder: (context) => const SignUpScreen(),
            //               ),
            //             );
            //           },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
