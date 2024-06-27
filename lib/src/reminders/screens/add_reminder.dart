import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/constants/enums.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/custom_button.dart';
import 'package:desktop_application/src/common/custom_popup.dart';
import 'package:desktop_application/src/common/custom_text_field.dart';
import 'package:desktop_application/src/reminders/screens/receiver_list.dart';
import 'package:desktop_application/src/reminders/screens/reminder_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddReminders extends StatefulWidget {
  final Screen screen;

  const AddReminders({super.key, required this.screen});

  @override
  State<AddReminders> createState() => _AddRemindersState();
}

class _AddRemindersState extends State<AddReminders> {
  //

  final _createDateController = TextEditingController();
  final _maturityDateController = TextEditingController();
  final _premiumDateController = TextEditingController();

  @override
  void dispose() {
    _createDateController.dispose();
    _maturityDateController.dispose();
    _premiumDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          (widget.screen == Screen.home) ? 'Add reminder' : 'Edit reminder',
        ),
        actions: [
          Visibility(
            visible: (widget.screen != Screen.home),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3 * AppUI.dw),
              child: IconButton.filledTonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomPopUp(
                        title: 'Are you sure to delete this reminder!',
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Policy name',
                ),
              ),
              CustomTextField(
                controller: _createDateController,
                readOnly: true,
                hintText: 'Created date',
                suffixIcon: _createDateController.text.isEmpty
                    ? IconButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);

                            setState(() {
                              _createDateController.text = formattedDate;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _createDateController.clear();
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                child: CustomTextField(
                  controller: _maturityDateController,
                  readOnly: true,
                  hintText: 'Maturity date',
                  suffixIcon: _maturityDateController.text.isEmpty
                      ? IconButton(
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );

                            if (pickedDate != null) {
                              final String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);

                              setState(() {
                                _maturityDateController.text = formattedDate;
                              });
                            }
                          },
                          icon: const Icon(Icons.calendar_month),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _maturityDateController.clear();
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                ),
              ),
              const CustomTextField(
                hintText: 'Policy amount',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Premium amount',
                ),
              ),
              CustomTextField(
                controller: _premiumDateController,
                readOnly: true,
                hintText: 'Premium due date',
                suffixIcon: _premiumDateController.text.isEmpty
                    ? IconButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );

                          if (pickedDate != null) {
                            final String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);

                            setState(() {
                              _premiumDateController.text = formattedDate;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _premiumDateController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.black,
                        ),
                      ),
              ),
              Visibility(
                visible: (widget.screen != Screen.home),
                child: Padding(
                  padding: EdgeInsets.only(top: 2 * AppUI.dh),
                  child: const ReceiverList(),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigation.navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const ReminderForm(),
                    ),
                  );
                },
                child: Text(
                  'Set alert for other',
                  style: TextStyle(
                    fontSize: 12 * AppUI.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4 * AppUI.dh,
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
    );
  }
}
