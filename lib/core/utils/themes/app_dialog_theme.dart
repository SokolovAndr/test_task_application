import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class AppDialogThemeData extends DialogThemeData {
  AppDialogThemeData(AppColors colors)
    : super(
        backgroundColor: colors.base0,
        surfaceTintColor: colors.base0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colors.base800,
          height: 1.5,
        ).def(),
      );
}
