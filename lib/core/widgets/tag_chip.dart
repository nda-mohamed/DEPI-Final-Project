import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:flutter/material.dart';


import '../../core/theme/app_text_styles.dart';

/// Small pill label (level badge, category tag, key phrase...).
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    this.background = AppColor.surfaceMuted,
    this.foreground = AppColor.textPrimary,
    this.large = false,
  });

  final String label;
  final Color background;
  final Color foreground;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 16 : 10,
        vertical: large ? 10 : 4,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.chip,
      ),
      child: Text(
        label,
        style: (large ? AppTextStyles.body : AppTextStyles.label)
            .copyWith(color: foreground),
      ),
    );
  }
}
