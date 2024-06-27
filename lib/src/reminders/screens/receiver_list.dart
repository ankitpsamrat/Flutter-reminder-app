import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/common/custom_popup.dart';
import 'package:flutter/material.dart';

class ReceiverList extends StatelessWidget {
  const ReceiverList({Key? key}) : super(key: key);

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
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 1.5 * AppUI.dh),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListTile(
                title: Text(
                  index != 1 ? 'ankit.test@gmail.com' : '9877452309',
                  style: TextStyle(fontSize: 12 * AppUI.sp),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomPopUp(
                          title:
                              'Are you sure to delete this receiver details!',
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
                dense: true,
                contentPadding: EdgeInsets.only(left: 4 * AppUI.dw),
              ),
            );
          },
        ),
      ],
    );
  }
}
