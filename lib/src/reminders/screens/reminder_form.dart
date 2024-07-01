import 'package:flutter/material.dart';

import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/custom_button.dart';
import 'package:desktop_application/src/common/custom_text_field.dart';

class ReminderForm extends StatelessWidget {
  const ReminderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Receiver info'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(3 * AppUI.dw),
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.3),
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'To enhance your reminder system, please include details of the recipients who should receive alerts related to this reminder, such as due alerts, delay alerts, etc.',
                  style: TextStyle(
                    fontSize: 12 * AppUI.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Receiver whatsapp no',
                ),
              ),
              const CustomTextField(
                hintText: 'Receiver phone no',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Receiver email',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * AppUI.dh,
                  bottom: 2 * AppUI.dh,
                ),
                child: CustomButton(
                  title: 'Submit',
                  onTap: () {
                    // Navigation.navigatorKey.currentState!.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
