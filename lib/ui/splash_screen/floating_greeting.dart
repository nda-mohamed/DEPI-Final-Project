import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_color/app_color.dart';

class Greeting {
  final String text;
  final Alignment alignment;
  final double rotation;
  const Greeting(this.text, this.alignment, this.rotation);
}

class FloatingGreeting extends StatelessWidget {
  const FloatingGreeting({
    super.key,
    required this.data,
    required this.index,
    required this.total,
    required this.controller,
  });

  final Greeting data;
  final int index;
  final int total;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: data.alignment,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final phase = (controller.value + index / total) * 2 * math.pi;
          return Transform.translate(
            offset: Offset(0, math.sin(phase) * 6),
            child: Transform.rotate(angle: data.rotation, child: child),
          );
        },
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: 500 + index * 120),
          curve: Curves.easeOutBack,
          builder: (context, v, child) => Opacity(
            opacity: v.clamp(0.0, 1.0),
            child: Transform.scale(scale: 0.8 + 0.2 * v, child: child),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: AppColor.white.withValues(alpha: 0.28),
              ),
            ),
            child: Text(
              data.text,
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}