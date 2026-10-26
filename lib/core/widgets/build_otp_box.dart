import 'package:flutter/material.dart';
import '../app_color/app_color.dart';

class BuildOtpBox extends StatelessWidget {
  const BuildOtpBox({
    super.key,
    required this.digit,
    required this.isActive,
    this.showCursor = false,
  });

  final String digit;
  final bool isActive;
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? AppColor.primary : Colors.grey.shade300,
            width: isActive ? 2 : 1.5,
          ),
        ),
        child: showCursor
            ? Container(width: 2, height: 20, color: AppColor.primary)
            : Text(
                digit,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primarytext,
                ),
              ),
      ),
    );
  }
}
