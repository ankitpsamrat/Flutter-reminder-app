import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/notification/screens/notification_view.dart';
import 'package:desktop_application/src/reminders/screens/add_reminder.dart';
import 'package:desktop_application/src/reminders/screens/reminders_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ankit'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              Navigation.navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => const AddReminders(),
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
      body: const Center(
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
        child: RemindersList(),
      ),
    );
  }
}
