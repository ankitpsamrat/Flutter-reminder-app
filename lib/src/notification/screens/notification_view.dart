import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: const Text('Reminder'),
            subtitle: const Text('Your bajaj finance due is coming soon.'),
            contentPadding: EdgeInsets.only(left: 6 * AppUI.dw),
            trailing: PopupMenuButton(
              padding: EdgeInsets.zero,
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('Mark as read')),
                ];
              },
            ),
          );
        },
      ),
    );
  }
}
