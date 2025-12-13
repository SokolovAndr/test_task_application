import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class AppTextFieldsTheme extends InputDecorationTheme {
  AppTextFieldsTheme(AppColors colors, {super.key})
    : super(
        hintStyle: TextStyle(color: colors.base400).def(),
        fillColor: colors.base0,
        errorMaxLines: 10,
        filled: true,
        isDense: true,
        suffixIconColor: colors.base400,
        prefixStyle: TextStyle(fontSize: 16, color: colors.base800).def(),
        contentPadding: const EdgeInsets.fromLTRB(0, 9, 12, 9),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.base200!),
          borderRadius: BorderRadius.circular(4),
        ),
        errorStyle: const TextStyle(fontSize: 16, height: 1.28).def(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary500!),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.base200!),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary200!),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.danger500!),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.danger500!),
          borderRadius: BorderRadius.circular(4),
        ),
      );
}
