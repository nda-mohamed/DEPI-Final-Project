import 'package:flutter/material.dart';
import '../../../../../core/app_color/app_color.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.size = 76, this.showCamera = false});

  final double size;
  final bool showCamera;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(color: AppColor.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Color(0x1A161A26), blurRadius: 10)]),
          child: CircleAvatar(backgroundColor: AppColor.secondary1, child: Icon(Icons.person_rounded, size: size * .53, color: AppColor.gray1)),
        ),
        if (showCamera)
          Positioned(
            bottom: -2,
            right: -3,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: AppColor.primary, shape: BoxShape.circle),
              child: const Icon(Icons.camera_alt_outlined, color: AppColor.white, size: 15),
            ),
          ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          ProfileAvatar(),
          SizedBox(height: 10),
          Text('Lucía Romero', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColor.primarytext)),
          SizedBox(height: 6),
          _LanguagePill(),
        ],
      ),
    );
  }
}

class _LanguagePill extends StatelessWidget {
  const _LanguagePill();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: AppColor.green1, borderRadius: BorderRadius.circular(20)),
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.language, size: 14, color: AppColor.green3),
          SizedBox(width: 4),
          Text('Spanish · B1', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.green3)),
        ]),
      );
}
