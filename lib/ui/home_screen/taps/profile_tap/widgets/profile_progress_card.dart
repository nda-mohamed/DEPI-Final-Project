import 'package:flutter/material.dart';
import '../../../../../core/app_color/app_color.dart';

class ProfileProgressCard extends StatelessWidget {
  const ProfileProgressCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(28), border: Border.all(color: AppColor.secondary2)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('This week', style: TextStyle(fontWeight: FontWeight.w800, color: AppColor.primarytext)),
            Text('3h 12m speaking', style: TextStyle(fontSize: 11, color: AppColor.gray1)),
          ]),
          const SizedBox(height: 16),
          const _WeekBars(),
        ]),
      );
}

class _WeekBars extends StatelessWidget {
  const _WeekBars();
  static const _heights = [14.0, 24.0, 11.0, 28.0, 20.0, 50.0, 10.0];
  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_heights.length, (index) => Column(children: [
          Container(width: 25, height: _heights[index], decoration: BoxDecoration(color: index == 5 ? AppColor.primary : AppColor.secondary1, borderRadius: BorderRadius.circular(16))),
          const SizedBox(height: 7),
          Text(_days[index], style: const TextStyle(fontSize: 10, color: AppColor.gray1)),
        ])),
      );
}
