import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../core/app_color/app_color.dart';

class LoadingDots extends StatelessWidget {
  const LoadingDots({super.key, required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final phase = (controller.value * 2 * math.pi) - (i * 0.9);
            final t = (math.sin(phase) + 1) / 2;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 6 + 3 * t,
              height: 6 + 3 * t,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.background.withValues(alpha: 0.4 + 0.5 * t),
              ),
            );
          }),
        );
      },
    );
  }
}