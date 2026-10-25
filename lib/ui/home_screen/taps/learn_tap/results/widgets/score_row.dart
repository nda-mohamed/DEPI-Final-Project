import 'package:depi_final_project/core/widgets/linear_progress_line.dart';
import 'package:flutter/material.dart';



import 'package:depi_final_project/core/theme/app_text_styles.dart';

class ScoreRow extends StatelessWidget {
  const ScoreRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.body),
            Text(
              '${(value * 100).round()}%',
              style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressLine(value: value, color: color, height: 7),
      ],
    );
  }
}
