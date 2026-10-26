import 'package:flutter/material.dart';

import '../app_color/app_color.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
  });

  final String hintText;
  final IconData icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8, left: 11),
          child: Icon(icon, color: AppColor.gray1),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColor.gray1,
        ),
        filled: true,
        fillColor: AppColor.secondary1,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
    );
  }
}
