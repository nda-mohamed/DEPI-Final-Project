import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';



class LinearProgressLine extends StatelessWidget {
  const LinearProgressLine({
    super.key,
    required this.value,
    this.color = AppColor.primary,
    this.trackColor = AppColor.surfaceMuted,
    this.height = 5,
  });

  final double value;
  final Color color;
  final Color trackColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: LinearProgressIndicator(
        value: value.clamp(0, 1),
        minHeight: height,
        color: color,
        backgroundColor: trackColor,
      ),
    );
  }
}
