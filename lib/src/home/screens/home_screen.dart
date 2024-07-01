import 'package:flutter/material.dart';

import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/auth/models/user_info_model.dart';
import 'package:desktop_application/src/notification/screens/notification_view.dart';
import 'package:desktop_application/src/policy/screens/add_policy.dart';
import 'package:desktop_application/src/policy/screens/user_policies.dart';

class HomeScreen extends StatelessWidget {
  final UserInfoModel userInfo;

  const HomeScreen({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hey ${userInfo.firstName}',
          style: TextStyle(
            fontSize: 18 * AppUI.sp,
            color: AppColors.active,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigation.navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const AddPolicy(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * AppUI.dw),
            child: IconButton.filledTonal(
              onPressed: () {
                Navigation.navigatorKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationView(),
                  ),
                );
              },
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: Center(
        // child: ElevatedButton.icon(
        //   onPressed: () {},
        //   style: TextButton.styleFrom(
        //     backgroundColor: AppColors.blue,
        //     foregroundColor: AppColors.white,
        //   ),
        //   icon: const Icon(Icons.add),
        //   label: Text(
        //     'Add Reminder',
        //     style: TextStyle(
        //       fontSize: 12 * AppUI.sp,
        //     ),
        //   ),
        // ),
        child: UserPolicies(
          clientID: userInfo.clientId,
          userID: userInfo.userId,
        ),
      ),
    );
  }
}
