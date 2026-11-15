
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class TutorTipCard extends StatelessWidget {
  const TutorTipCard({
    super.key,
    required this.tutorName,
    required this.before,
    required this.boldA,
    required this.middle,
    required this.boldB,
    required this.after,
  });

  final String tutorName;
  final String before;
  final String boldA;
  final String middle;
  final String boldB;
  final String after;

  @override
  Widget build(BuildContext context) {
    final bold = AppTextStyles.body.copyWith(fontWeight: FontWeight.w800);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColor.mint.withValues(alpha: 0.6),
        borderRadius: AppRadius.card,
        border: Border.all(color: AppColor.mint),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_outline_rounded,
                  size: 18, color: AppColor.mintDark),
              const SizedBox(width: 6),
              Text('Tip from $tutorName',
                  style: AppTextStyles.body
                      .copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text.rich(
            TextSpan(
              style: AppTextStyles.body,
              children: [
                TextSpan(text: before),
                TextSpan(text: boldA, style: bold),
                TextSpan(text: middle),
                TextSpan(text: boldB, style: bold),
                TextSpan(text: after),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
