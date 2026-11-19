import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class MissionCard extends StatelessWidget {
  const MissionCard({super.key, required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('YOUR MISSION', style: AppTextStyles.overline),
          const SizedBox(height: AppSpacing.md),
          for (var i = 0; i < steps.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColor.primarySoft,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: AppTextStyles.label
                          .copyWith(color: AppColor.primary),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(child: Text(steps[i], style: AppTextStyles.body)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
