import 'package:desktop_application/constants/colors.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/confirmation_popup.dart';
import 'package:flutter/material.dart';

class AddReminders extends StatelessWidget {
  const AddReminders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton.filledTonal(
          //   onPressed: () {},
          //   icon: const Icon(Icons.edit),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3 * AppUI.dw),
            child: IconButton.filledTonal(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ConfirmationPopUp();
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Policy name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Created date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Maturity date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Policy amount',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Premium amount',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Premium due date',
                ),
              ),
            ),
            SizedBox(height: 2 * AppUI.dh),
            ElevatedButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
              ),
              icon: const Icon(Icons.file_copy),
              label: Text(
                'Attach doc',
                style: TextStyle(
                  fontSize: 12 * AppUI.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 6 * AppUI.dh,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 4 * AppUI.dh),
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 15 * AppUI.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
