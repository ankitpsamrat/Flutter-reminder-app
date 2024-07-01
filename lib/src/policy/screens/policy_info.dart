import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/src/common/custom_popup.dart';
import 'package:desktop_application/src/common/custom_snackbar.dart';
import 'package:desktop_application/src/reminders/screens/receiver_list.dart';
import 'package:flutter/material.dart';

import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/custom_text_field.dart';
import 'package:desktop_application/src/policy/models/user_policy_model.dart';
import 'package:desktop_application/utils/common_utils.dart';
import 'package:http/http.dart' as http;

class PolicyInfo extends StatefulWidget {
  final UserPolicyModel policyInfo;

  const PolicyInfo({super.key, required this.policyInfo});

  @override
  State<PolicyInfo> createState() => _PolicyInfoState();
}

class _PolicyInfoState extends State<PolicyInfo> {
  //

  final _formKey = GlobalKey<FormState>();
  final _policyNameController = TextEditingController();
  final _createDateController = TextEditingController();
  final _maturityDateController = TextEditingController();
  final _policyAmtController = TextEditingController();
  final _premiumAmtController = TextEditingController();
  final _premiumDateController = TextEditingController();

  Future<void> _deletedPolicy({required int policyID}) async {
    try {
      final response = await http.delete(
        Uri.parse('http://166.0.242.94:80/api/policies/$policyID'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200) {
        CustomSnackbar.showSnackbar(msg: 'Policy deleted successfully');
      } else {
        CustomSnackbar.showSnackbar(
          msg: 'Failed to delete policy',
          bgColor: AppColors.red,
        );
        throw Exception('Failed to delete policy');
      }
    } catch (e) {
      debugPrint('Unable to delete policy: $e');
      CustomSnackbar.showSnackbar(
        msg: 'Unable to delete policy',
        bgColor: AppColors.red,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _policyNameController.text = widget.policyInfo.policyNumber;
    _createDateController.text =
        CommonUtils.formattedDate(widget.policyInfo.policyCreateDate);
    _maturityDateController.text =
        CommonUtils.formattedDate(widget.policyInfo.maturityDate);
    _policyAmtController.text = widget.policyInfo.policyAmount.toString();
    // _premiumAmtController.text = widget.policyData.pre;
    _premiumDateController.text =
        CommonUtils.formattedDate(widget.policyInfo.premiumDueDate);
  }

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
        title: const Text('Policy Details'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * AppUI.dw),
            child: IconButton.filledTonal(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomPopUp(
                      title: 'Are you sure to delete this reminder!',
                      primaryAction: () {
                        _deletedPolicy(policyID: widget.policyInfo.policyId)
                            .then((value) {
                          Navigation.navigatorKey.currentState!.pop();
                          Navigation.navigatorKey.currentState!.pop();
                        });
                      },
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
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
                ReceiverList(policyInfo: widget.policyInfo),
                // TextButton(
                //   onPressed: () {
                //     Navigation.navigatorKey.currentState!.push(
                //       MaterialPageRoute(
                //         builder: (context) => const ReminderForm(),
                //       ),
                //     );
                //   },
                //   child: Text(
                //     'Set reminder for others',
                //     style: TextStyle(
                //       fontSize: 12 * AppUI.sp,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     top: 6 * AppUI.dh,
                //     bottom: 2 * AppUI.dh,
                //   ),
                //   child: CustomButton(
                //     title: 'Submit',
                //     onTap: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
