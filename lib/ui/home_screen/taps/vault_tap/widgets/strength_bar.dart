


import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';

class StrengthBar extends StatelessWidget {
  final int strength;
  const StrengthBar({super.key, required this.strength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i){
        final filled =i<strength;
        return Container(
          width: 5,
          height: 14,
          margin: EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
            color: filled
             ? AppColor.primary
             :AppColor.primary.withValues(alpha: 0.15),
               borderRadius: BorderRadius.circular(3),
          ),
        );
      })
    );
  }
}