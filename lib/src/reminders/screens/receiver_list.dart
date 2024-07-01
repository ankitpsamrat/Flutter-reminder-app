import 'package:flutter/material.dart';

import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/policy/models/user_policy_model.dart';

class ReceiverList extends StatelessWidget {
  final UserPolicyModel policyInfo;

  const ReceiverList({super.key, required this.policyInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Alert receiver details',
          style: TextStyle(
            fontSize: 12 * AppUI.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
          itemCount: policyInfo.reminderDTOs.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final ReminderDtoModel reminderDto = policyInfo.reminderDTOs[index];

            return Container(
              margin: EdgeInsets.only(top: 1.5 * AppUI.dh),
              padding: EdgeInsets.all(2 * AppUI.dw),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${reminderDto.contactName}'),
                  Text('Phone: ${reminderDto.contactPhone}'),
                  Text('Email: ${reminderDto.email}'),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
