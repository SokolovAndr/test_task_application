import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class AppSegmentedButtonTheme extends SegmentedButtonThemeData {
  AppSegmentedButtonTheme(this.colors)
    : super(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          shape: WidgetStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            );
          }),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return BorderSide(color: colors.primary500!);
            }
            return BorderSide(color: colors.base400!);
          }),
          enableFeedback: false,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primary500;
            }
            return colors.base400;
          }),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        selectedIcon: const SizedBox.shrink(),
      );
  final AppColors colors;
}
