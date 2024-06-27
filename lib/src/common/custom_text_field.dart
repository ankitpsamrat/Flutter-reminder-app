import 'package:desktop_application/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final String hintText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.controller,
    this.readOnly = false,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 12 * AppUI.sp),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
