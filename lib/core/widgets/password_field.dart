import 'package:flutter/material.dart';
import '../app_color/app_color.dart';
import 'custom_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomField(
      hintText: widget.hintText,
      icon: Icons.lock_outline,
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
          color: AppColor.gray1,
        ),
      ),
    );
  }
}
