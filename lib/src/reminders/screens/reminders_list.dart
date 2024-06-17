import 'package:desktop_application/helpers/navigation.dart';
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
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigation.navigatorKey.currentState!.push(
              MaterialPageRoute(
                builder: (context) => const AddReminders(),
              ),
            );
          },
        );
      },
    );
  }
}
