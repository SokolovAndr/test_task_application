import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class AppPopupMenuTheme extends PopupMenuThemeData {
  AppPopupMenuTheme(AppColors colors)
    : super(
        surfaceTintColor: colors.base0,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.base200,
            ).def();
          }
          return TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors.base800,
          ).def();
        }),
      );
}
