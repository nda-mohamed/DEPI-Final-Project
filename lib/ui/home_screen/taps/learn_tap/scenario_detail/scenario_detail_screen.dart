import 'package:depi_final_project/core/widgets/primary_button.dart';
import 'package:depi_final_project/core/widgets/tag_chip.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

import '../chat/chat_screen.dart';
import 'widgets/hero_header.dart';
import 'widgets/mission_card.dart';

class ScenarioDetailScreen extends StatelessWidget {
  const ScenarioDetailScreen({super.key, required this.scenario});

  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeroHeader(
                  scenario: scenario,
                  onClose: () => Navigator.of(context).pop(),
                ),
                Padding(
                  padding: AppSpacing.screenH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(scenario.title, style: AppTextStyles.h1),
                      const SizedBox(height: AppSpacing.md),
                      _MetaRow(scenario: scenario),
                      const SizedBox(height: AppSpacing.xl),
                      if (scenario.mission.isNotEmpty)
                        MissionCard(steps: scenario.mission),
                      if (scenario.keyPhrases.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xl),
                        Text('KEY PHRASES', style: AppTextStyles.overline),
                        const SizedBox(height: AppSpacing.md),
                        Wrap(
                          spacing: AppSpacing.sm,
                          runSpacing: AppSpacing.sm,
                          children: [
                            for (final p in scenario.keyPhrases)
                              TagChip(label: p, large: true),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xl, AppSpacing.md, AppSpacing.xl, AppSpacing.md),
              child: PrimaryButton(
                label: 'Start conversation',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(scenario: scenario),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.scenario});

  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    Widget item(IconData icon, String text) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: AppColor.textSecondary),
            const SizedBox(width: 4),
            Text(text, style: AppTextStyles.bodyMuted),
          ],
        );

    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.sm,
      children: [
        item(Icons.location_on_outlined, scenario.city),
        item(Icons.schedule_rounded, '${scenario.minutes} min'),
        item(Icons.bolt_rounded, '+${scenario.xp} XP'),
      ],
    );
  }
}
