import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      primary: AppColor.primary,
      surface: AppColor.background,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColor.background,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      textTheme: TextTheme(
        bodyMedium: AppTextStyles.body,
        titleMedium: AppTextStyles.title,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColor.divider,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
