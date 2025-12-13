import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class AppBottomSheetTheme extends BottomSheetThemeData {
  AppBottomSheetTheme(this.colors)
    : super(
        backgroundColor: colors.baseWhite,
        modalBarrierColor: colors.base900?.withValues(alpha: 0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      );
  final AppColors colors;
}
