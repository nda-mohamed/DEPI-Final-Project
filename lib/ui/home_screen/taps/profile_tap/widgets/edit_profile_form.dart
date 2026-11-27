import 'package:flutter/material.dart';
import '../../../../../core/app_color/app_color.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ProfileField(icon: Icons.person_outline, label: 'Full name', value: 'Lucía Romero', selected: true),
        const SizedBox(height: 10),
        const ProfileField(icon: Icons.mail_outline, label: 'Email', value: 'lucia@mail.com'),
        const SizedBox(height: 10),
        const ProfileField(icon: Icons.language, label: 'Native language', value: 'English', hasArrow: true),
        const SizedBox(height: 10),
        const ProfileField(icon: Icons.translate, label: 'Learning', value: 'Spanish · B1', hasArrow: true),
        const SizedBox(height: 24),
        const Text('SECURITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: .5, color: AppColor.gray1)),
        const SizedBox(height: 10),
        const ProfileField(icon: Icons.lock_outline, label: '', value: 'Change password', hasArrow: true, compact: true),
        const SizedBox(height: 14),
        Center(child: TextButton(onPressed: () {}, child: const Text('Delete account', style: TextStyle(color: AppColor.red, fontWeight: FontWeight.w700)))),
      ]);
}

class ProfileField extends StatelessWidget {
  const ProfileField({super.key, required this.icon, required this.label, required this.value, this.hasArrow = false, this.selected = false, this.compact = false});
  final IconData icon;
  final String label;
  final String value;
  final bool hasArrow;
  final bool selected;
  final bool compact;

  @override
  Widget build(BuildContext context) => Container(
        height: compact ? 56 : 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: selected ? AppColor.primary : AppColor.secondary2, width: selected ? 1.4 : 1)),
        child: Row(children: [
          Icon(icon, color: AppColor.gray1, size: 20),
          const SizedBox(width: 14),
          Expanded(child: label.isEmpty
              ? Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.primarytext))
              : Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(label, style: const TextStyle(fontSize: 11, color: AppColor.gray1)),
                  const SizedBox(height: 2),
                  Text(value, style: const TextStyle(fontSize: 15, color: AppColor.primarytext)),
                ])),
          if (hasArrow) const Icon(Icons.chevron_right_rounded, color: AppColor.gray1),
        ]),
      );
}
