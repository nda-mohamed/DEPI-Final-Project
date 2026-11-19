
import 'package:depi_final_project/core/widgets/icon_badge.dart';
import 'package:depi_final_project/core/widgets/linear_progress_line.dart';
import 'package:depi_final_project/core/widgets/tag_chip.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class ScenarioCard extends StatelessWidget {
  const ScenarioCard({super.key, required this.scenario, required this.onTap});

  final Scenario scenario;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.card,
        side: const BorderSide(color: AppColor.border),
      ),
      child: InkWell(
        borderRadius: AppRadius.card,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              IconBadge(
                icon: scenario.icon,
                background: scenario.iconBg,
                color: scenario.iconColor,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(scenario.title, style: AppTextStyles.title),
                    const SizedBox(height: 2),
                    Text(scenario.subtitle, style: AppTextStyles.caption),
                    if (scenario.progress != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      FractionallySizedBox(
                        widthFactor: 0.85,
                        alignment: Alignment.centerLeft,
                        child: LinearProgressLine(
                          value: scenario.progress!,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              TagChip(label: scenario.level.label),
            ],
          ),
        ),
      ),
    );
  }
}
