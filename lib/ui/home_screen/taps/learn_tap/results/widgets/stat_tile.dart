
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColor.surfaceMuted,
        borderRadius: AppRadius.card,
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColor.primary, size: 22),
          const SizedBox(height: AppSpacing.xs),
          Text(value, style: AppTextStyles.h1.copyWith(fontSize: 24)),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
