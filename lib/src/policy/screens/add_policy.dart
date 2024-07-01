import 'package:flutter/material.dart';

import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/custom_button.dart';
import 'package:desktop_application/src/common/custom_text_field.dart';
import 'package:desktop_application/src/reminders/screens/reminder_form.dart';
import 'package:desktop_application/utils/common_utils.dart';

class AddPolicy extends StatefulWidget {
  const AddPolicy({super.key});

  @override
  State<AddPolicy> createState() => _AddPolicyState();
}

class _AddPolicyState extends State<AddPolicy> {
  //

  final _formKey = GlobalKey<FormState>();
  final _policyNameController = TextEditingController();
  final _createDateController = TextEditingController();
  final _maturityDateController = TextEditingController();
  final _policyAmtController = TextEditingController();
  final _premiumAmtController = TextEditingController();
  final _premiumDateController = TextEditingController();

  @override
  void dispose() {
    _policyNameController.dispose();
    _createDateController.dispose();
    _maturityDateController.dispose();
    _policyAmtController.dispose();
    _premiumAmtController.dispose();
    _premiumDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                  child: CustomTextField(
                    controller: _policyNameController,
                    hintText: 'Policy name',
                  ),
                ),
                CustomTextField(
                  controller: _createDateController,
                  readOnly: true,
                  hintText: 'Created date',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );

                      if (pickedDate != null) {
                        final String formattedDate =
                            CommonUtils.formattedDate(pickedDate);

                        setState(() {
                          _createDateController.text = formattedDate;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                  child: CustomTextField(
                    controller: _maturityDateController,
                    readOnly: true,
                    hintText: 'Maturity date',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );

                        if (pickedDate != null) {
                          final String formattedDate =
                              CommonUtils.formattedDate(pickedDate);

                          setState(() {
                            _maturityDateController.text = formattedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                ),
                CustomTextField(
                  controller: _policyAmtController,
                  hintText: 'Policy amount',
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                //   child: CustomTextField(
                //     controller: _premiumAmtController,
                //     hintText: 'Premium amount',
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2 * AppUI.dh,
                    bottom: 4 * AppUI.dh,
                  ),
                  child: CustomTextField(
                    controller: _premiumDateController,
                    readOnly: true,
                    hintText: 'Premium due date',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );

                        if (pickedDate != null) {
                          final String formattedDate =
                              CommonUtils.formattedDate(pickedDate);

                          setState(() {
                            _premiumDateController.text = formattedDate;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                ),
                SizedBox(height: 4 * AppUI.dh),
                TextButton(
                  onPressed: () {
                    Navigation.navigatorKey.currentState!.push(
                      MaterialPageRoute(
                        builder: (context) => const ReminderForm(),
                      ),
                    );
                  },
                  child: Text(
                    'Set reminder for others',
                    style: TextStyle(
                      fontSize: 12 * AppUI.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6 * AppUI.dh,
                    bottom: 2 * AppUI.dh,
                  ),
                  child: CustomButton(
                    title: 'Submit',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
