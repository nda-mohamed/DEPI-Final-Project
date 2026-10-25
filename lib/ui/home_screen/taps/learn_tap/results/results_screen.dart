import 'package:depi_final_project/core/widgets/primary_button.dart';

import 'package:depi_final_project/data/mock/mock_data.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';
import 'package:depi_final_project/core/widgets/circle_icon_button.dart';
import 'widgets/score_row.dart';
import 'widgets/stat_tile.dart';
import 'widgets/tutor_tip_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.scenario});

  final Scenario scenario;

  void _backToRoot(BuildContext context) =>
      Navigator.of(context).popUntil((route) => route.isFirst);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: AppSpacing.screenH,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleIconButton(
                      icon: Icons.close_rounded,
                      onTap: () => _backToRoot(context),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Center(
                    child: Container(
                      width: 104,
                      height: 104,
                      decoration: const BoxDecoration(
                        color: AppColor.yellowlight,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.emoji_events_outlined,
                          size: 52, color: AppColor.primary),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    '¡Muy bien, ${MockData.userName}!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'You completed ${scenario.title}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMuted.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(
                        child: StatTile(
                          icon: Icons.bolt_rounded,
                          value: '+${scenario.xp}',
                          label: 'XP',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      const Expanded(
                        child: StatTile(
                          icon: Icons.schedule_rounded,
                          value: '4:52',
                          label: 'Minutes',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      const Expanded(
                        child: StatTile(
                          icon: Icons.star_border_rounded,
                          value: '6',
                          label: 'New words',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const ScoreRow(
                    label: 'Pronunciation',
                    value: 0.86,
                    color: AppColor.primary,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const ScoreRow(
                    label: 'Grammar',
                    value: 0.74,
                    color: AppColor.mintDark,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const ScoreRow(
                    label: 'Fluency',
                    value: 0.68,
                    color: AppColor.yellowDark,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const TutorTipCard(
                    tutorName: 'Sofía',
                    before: 'Try ',
                    boldA: '“me pone”',
                    middle: ' instead of ',
                    boldB: '“quiero”',
                    after: ' — it\'s how locals order in Spain.',
                  ),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.md),
              child: Column(
                children: [
                  PrimaryButton(
                    label: 'Continue',
                    onPressed: () => _backToRoot(context),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  PrimaryButton(
                    label: 'Replay conversation',
                    icon: Icons.volume_up_outlined,
                    style: AppButtonStyle.outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
