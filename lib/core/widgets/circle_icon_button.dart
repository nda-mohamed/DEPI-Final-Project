import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';


/// Round icon-only button (close, back, search, mic...).
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 44,
    this.background = AppColor.surface,
    this.color = AppColor.textPrimary,
    this.bordered = true,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color background;
  final Color color;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: CircleBorder(
        side: bordered
            ? const BorderSide(color: AppColor.border)
            : BorderSide.none,
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, size: size * 0.45, color: color),
        ),
      ),
    );
  }
}
