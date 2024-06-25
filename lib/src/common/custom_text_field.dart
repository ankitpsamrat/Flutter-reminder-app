import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 12 * AppUI.sp),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        hintText: hintText,
      ),
    );
  }
}
