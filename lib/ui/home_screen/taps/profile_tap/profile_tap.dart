import 'package:flutter/material.dart';
import '../../../../core/app_color/app_color.dart';
import 'edit_profile_screen.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_progress_card.dart';
import 'widgets/profile_stat_card.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Profile', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColor.primarytext)),
                  IconButton(
                    tooltip: 'Edit profile',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                    ),
                    icon: const Icon(Icons.settings_outlined),
                    style: IconButton.styleFrom(
                      foregroundColor: AppColor.primarytext,
                      side: const BorderSide(color: AppColor.secondary2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const ProfileHeader(),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Expanded(child: ProfileStatCard(icon: Icons.local_fire_department_outlined, iconColor: AppColor.primary, value: '14d', label: 'Streak')),
                  SizedBox(width: 10),
                  Expanded(child: ProfileStatCard(icon: Icons.bolt_outlined, iconColor: AppColor.yellow, value: '3,420', label: 'XP')),
                  SizedBox(width: 10),
                  Expanded(child: ProfileStatCard(icon: Icons.emoji_events_outlined, iconColor: AppColor.green2, value: 'Gold', label: 'League')),
                ],
              ),
              const SizedBox(height: 16),
              const ProfileProgressCard(),
              const SizedBox(height: 20),
              const Text('Achievements', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColor.primarytext)),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AchievementBadge(icon: Icons.workspace_premium_outlined, label: 'Café Pro', color: Color(0xFFFFE6DE)),
                  AchievementBadge(icon: Icons.local_fire_department_outlined, label: '14-day', color: Color(0xFFFFEDC4)),
                  AchievementBadge(icon: Icons.emoji_events_outlined, label: 'Top 5%', color: AppColor.green1),
                  AchievementBadge(icon: Icons.adjust_outlined, label: 'Goal x7', color: AppColor.secondary1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
