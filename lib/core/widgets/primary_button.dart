import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:flutter/material.dart';


import '../../core/theme/app_text_styles.dart';

enum AppButtonStyle { primary, dark, outlined }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.style = AppButtonStyle.primary,
    this.height = 58,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppButtonStyle style;
  final double height;

  @override
  Widget build(BuildContext context) {
    final bg = switch (style) {
      AppButtonStyle.primary => AppColor.primary,
      AppButtonStyle.dark => AppColor.dark,
      AppButtonStyle.outlined => Colors.transparent,
    };
    final fg =
        style == AppButtonStyle.outlined ? AppColor.textPrimary : Colors.white;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        color: bg,
        borderRadius: AppRadius.button,
        shadowColor: AppColor.primary.withValues(alpha: 0.4),
        elevation: style == AppButtonStyle.primary ? 6 : 0,
        child: InkWell(
          borderRadius: AppRadius.button,
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: AppRadius.button,
              border: style == AppButtonStyle.outlined
                  ? Border.all(color: AppColor.border, width: 1.5)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: fg),
                  const SizedBox(width: AppSpacing.sm),
                ],
                Text(label, style: AppTextStyles.button.copyWith(color: fg)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
