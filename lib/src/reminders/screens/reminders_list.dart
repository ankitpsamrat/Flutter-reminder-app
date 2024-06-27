import 'package:desktop_application/constants/enums.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/reminders/screens/add_reminder.dart';
import 'package:flutter/material.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text('$index'),
          title: Text('Your Policy/task/bill $index'),
          subtitle: Text('Due date: ${DateTime.now()}'),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 4 * AppUI.dw,
          ),
          onTap: () {
            Navigation.navigatorKey.currentState!.push(
              MaterialPageRoute(
                builder: (context) =>
                    const AddReminders(screen: Screen.addReminder),
              ),
            );
          },
        );
      },
    );
  }
}
