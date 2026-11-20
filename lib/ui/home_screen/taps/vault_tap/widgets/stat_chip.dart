

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';

class StatChip extends StatelessWidget {
  final String value;
  final String label;
  const StatChip({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(vertical: 12),
decoration: BoxDecoration(
  color: AppColor.secondary1,
  borderRadius: BorderRadius.circular(20),
),
child: Column(
  children: [
    Text(value,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: AppColor.textPrimary,
    ),
    ),
    SizedBox(height: 4,),
    Text(
      label,
      style: TextStyle(
        fontSize: 11,
        color: AppColor.gray1,
      ),
    )
  ],
),
    );
  }
}