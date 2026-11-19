
import 'package:depi_final_project/core/widgets/tutor_avatar.dart';

import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';


class PulsingAvatar extends StatefulWidget {
  const PulsingAvatar({super.key, this.size = 190});

  final double size;

  @override
  State<PulsingAvatar> createState() => _PulsingAvatarState();
}

class _PulsingAvatarState extends State<PulsingAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return SizedBox(
          width: s * 1.5,
          height: s * 1.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _ring(s * (1.5 + 0.04 * t), 0.18),
              _ring(s * (1.28 + 0.03 * t), 0.35),
              Container(
                width: s * 1.05,
                height: s * 1.05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primary, width: 4),
                ),
              ),
              child!,
            ],
          ),
        );
      },
      child: TutorAvatar(size: s * 0.92,image:  const AssetImage('assets/images/person.png'),),
    );
  }

  Widget _ring(double d, double alpha) => Container(
        width: d,
        height: d,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primary.withValues(alpha: alpha * 0.5),
        ),
      );
}
