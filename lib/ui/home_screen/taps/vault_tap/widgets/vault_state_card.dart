import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';


class VaultStateCard extends StatelessWidget {
  final int total, mastered, due;
  final VoidCallback onStartReview;

  const VaultStateCard({
    super.key,
    required this.total,
    required this.mastered,
    required this.due,
    required this.onStartReview,
  });

  @override
  Widget build(BuildContext context) {
    final rest = (total - mastered - due).clamp(0, total);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.dark,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('Words saved',
                        style: TextStyle(fontSize: 12, color: AppColor.textOnDarkMuted)),
                    Text('$total',
                        style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ],
                ),
              ),
              _MiniStat(label: 'Mastered', value: '$mastered', color: AppColor.textOnDarkMuted),
               SizedBox(width: 16),
              _MiniStat(label: 'Due today', value: '$due', color: AppColor.yellow),
            ],
          ),
          const SizedBox(height: 12),
          _ProgressBar(total: total, mastered: mastered,
           due: due, rest: rest),
           SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onStartReview,
              icon: const Icon(Icons.psychology_outlined, size: 20),
              label: const Text('Start smart review',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MiniStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, 
        color: AppColor.textOnDarkMuted)),
        Text(value,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800,
                 color: color)),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int total, mastered, due, rest;
  const _ProgressBar({
    required this.total,
    required this.mastered,
    required this.due,
    required this.rest,
  });

  @override
  Widget build(BuildContext context) {
    Widget seg(int flex, Color c) =>
        Expanded(flex: flex, child: Container(color: c));

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: 6,
        child: total == 0
            ? Container(color: AppColor.darkSurface)
            : Row(children: [
                if (mastered > 0) seg(mastered, AppColor.green2),
                if (due > 0) seg(due, AppColor.yellow),
                if (rest > 0) seg(rest, AppColor.darkSurface),
              ]),
      ),
    );
  }
}