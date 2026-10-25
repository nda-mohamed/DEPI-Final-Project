import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';
import 'package:depi_final_project/data/mock/mock_data.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:depi_final_project/ui/home_screen/taps/learn_tap/chat/chat_screen.dart';
import 'package:depi_final_project/ui/home_screen/taps/learn_tap/scenario_detail/scenario_detail_screen.dart';
import 'package:flutter/material.dart';




import 'widgets/daily_goal_card.dart';
import 'widgets/scenario_card.dart';
import 'widgets/search_field.dart';
import 'widgets/streak_pill.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final scenarios = MockData.scenarios.where((scenario) {
      if (query.isEmpty) return true;
      return <String>[
        scenario.title,
        scenario.city,
        scenario.category,
        scenario.level.label,
        ...scenario.keyPhrases,
        ...scenario.mission,
      ].any((value) => value.toLowerCase().contains(query));
    }).toList();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.xxl,
          ),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buenos días, ${MockData.userName}',
                        style: AppTextStyles.bodyMuted,
                      ),
                      const SizedBox(height: 2),
                      Text('Pick a scenario', style: AppTextStyles.h1),
                    ],
                  ),
                ),
                const StreakPill(days: MockData.streak),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            SearchField(
              hint: 'Search a situation…',
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: AppSpacing.xl),
            const DailyGoalCard(
              progress: MockData.dailyGoalProgress,
              subtitle: '6 of 10 min spoken today',
            ),
            const SizedBox(height: AppSpacing.lg),
            if (scenarios.isEmpty) ...[
              const SizedBox(height: AppSpacing.xxxl),
              Icon(Icons.search_off_rounded,
                  size: 64,
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              const SizedBox(height: AppSpacing.md),
              Text('No scenarios found',
                  textAlign: TextAlign.center, style: AppTextStyles.h2),
              const SizedBox(height: AppSpacing.sm),
              Text(
                  "We don't have that one yet — but Sofía can role-play it in a free chat.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMuted),
              const SizedBox(height: AppSpacing.lg),
              Center(
                  child: FilledButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    scenario: Scenario(
                      title: _query.trim().isEmpty
                          ? 'Free conversation'
                          : _query.trim(),
                      city: 'Any topic',
                      minutes: 5,
                      level: CefrLevel.a1,
                      icon: Icons.forum_outlined,
                      iconBg: AppColor.primarySoft,
                      iconColor: AppColor.primary,
                    ),
                  ),
                )),
                child: const Text('Create with AI'),
              )),
            ],
            for (final s in scenarios) ...[
              ScenarioCard(
                scenario: s,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ScenarioDetailScreen(scenario: s),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ],
        ),
      ),
    );
  }
}
