import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/auth/screens/forgot_password.dart';
import 'package:desktop_application/src/common/custom_button.dart';
import 'package:desktop_application/src/common/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _fetchData() async {
    final Uri url = Uri.parse('http://166.0.242.94:80/api/clients');
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('apikey:meusam12#'))}';

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
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
              const CustomTextField(
                hintText: 'Enter your email',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Enter your password',
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
              Padding(
                padding: EdgeInsets.only(
                  top: 6 * AppUI.dh,
                  bottom: 2 * AppUI.dh,
                ),
                child: CustomButton(
                  title: 'Login',
                  bgColor: AppColors.active,
                  onTap: () {
                    _fetchData();
                    // Navigation.navigatorKey.currentState!.push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen(),
                    //   ),
                    // );
                  },
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
      ),
    );
  }
}
