import 'package:depi_final_project/core/widgets/tag_chip.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';

import 'package:depi_final_project/core/widgets/circle_icon_button.dart';

/// Top illustration area of the scenario screen.
/// Replace the gradient with an Image.asset when artwork is available.
class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key, required this.scenario, required this.onClose});

  final Scenario scenario;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: 300 + top,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/ordering.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: top + AppSpacing.sm,
            left: AppSpacing.lg,
            child: CircleIconButton(
              icon: Icons.close_rounded,
              onTap: onClose,
              background: Colors.black.withValues(alpha: 0.35),
              color: Colors.white,
              bordered: false,
            ),
          ),
          Positioned(
            top: top + AppSpacing.sm,
            right: AppSpacing.lg,
            child: CircleIconButton(
              icon: Icons.share_outlined,
              onTap: () => SharePlus.instance.share(ShareParams(
                text:
                    'Practice Spanish with me: ${scenario.title} in ${scenario.city}.',
                subject: scenario.title,
              )),
              background: Colors.black.withValues(alpha: 0.35),
              color: Colors.white,
              bordered: false,
            ),
          ),
          Positioned(
            left: AppSpacing.xl,
            bottom: AppSpacing.md,
            child: Row(
              children: [
                TagChip(
                  label: scenario.level.label,
                  background: AppColor.surface,
                ),
                const SizedBox(width: AppSpacing.sm),
                TagChip(
                  label: scenario.category,
                  background: AppColor.mint,
                  foreground: AppColor.mintDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
