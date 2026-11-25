import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';

class ReviewDoneScreen extends StatelessWidget {
  final int reviewed;
  final double accuracy;
  final int xp;
  final int streak;
  final VoidCallback onBack;
  final VoidCallback onpractice;
  const ReviewDoneScreen({
    super.key,
    required this.reviewed,
    required this.accuracy,
    required this.xp,
    required this.streak,
    required this.onBack,
    required this.onpractice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColor.mint,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColor.green2,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Review Complete !',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$reviewed words reviewed. Your memory is getting stronger.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColor.gray1),
              ),
              SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.bolt,
                      iconColor: AppColor.primary,
                      value: '+$xp XP',
                      label: ' Earned',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.psychology_outlined,
                      iconColor: AppColor.mintDark,
                      value: '${(accuracy * 100).round()}%',
                      label: ' Accuracy',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.yellowlight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: AppColor.primary,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$streak-day streak!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColor.textPrimary,
                            ),
                          ),

                          Text(
                            'Come back tomorrow to keep it going',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.gray1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onBack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Back to Vault',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: onpractice,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.surface,
                    foregroundColor: AppColor.textPrimary,
                    side: BorderSide(color: AppColor.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Practice in a conversation',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColor.textPrimary,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: AppColor.gray1)),
        ],
      ),
    );
  }
}
