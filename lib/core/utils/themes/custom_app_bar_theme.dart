import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class CustomAppBarTheme extends AppBarTheme {
  CustomAppBarTheme(Brightness brightness, AppColors colors, {super.key})
    : super(
        scrolledUnderElevation: 0.5,
        titleSpacing: 0,
        backgroundColor: colors.base0,
        surfaceTintColor: colors.base0,
        shadowColor: colors.base100,
        elevation: 0.5,
        toolbarHeight: 56,
        centerTitle: false,
        foregroundColor: colors.base800,
        iconTheme: IconThemeData(color: colors.base800),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: colors.base800,
          height: 1.2,
          fontWeight: FontWeight.w700,
        ).def(),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
        ),
      );
}
