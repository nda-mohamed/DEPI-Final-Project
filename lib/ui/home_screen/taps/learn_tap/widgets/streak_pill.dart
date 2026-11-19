import 'package:flutter/material.dart';


import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class StreakPill extends StatelessWidget {
  const StreakPill({super.key, required this.days});

  final int days;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.yellowlight,
        borderRadius: AppRadius.chip,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.local_fire_department_outlined,
              size: 18, color: AppColor.primary),
          const SizedBox(width: 4),
          Text('$days', style: AppTextStyles.title.copyWith(fontSize: 15)),
        ],
      ),
    );
  }
}
