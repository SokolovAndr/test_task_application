import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_bottom_sheet_theme.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/app_dialog_theme.dart';
import 'package:test_task_application/core/utils/themes/app_elevated_button_theme.dart';
import 'package:test_task_application/core/utils/themes/app_fab_theme.dart';
import 'package:test_task_application/core/utils/themes/app_segmented_button_menu.dart';
import 'package:test_task_application/core/utils/themes/custom_app_bar_theme.dart';
import 'package:test_task_application/core/utils/themes/app_popup_menu_theme.dart';
import 'package:test_task_application/core/utils/themes/app_text_fields_theme.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = AppColors.light;
    final lightTheme = ThemeData(
      fontFamily: 'Roboto',
      useMaterial3: true,
      extensions: const [colors],
      colorScheme: ColorScheme.light(
        error: colors.danger500!,
        primary: colors.primary500!,
        secondary: colors.primary500!.withValues(alpha: 0.5),
      ),
      floatingActionButtonTheme: const AppFabTheme(),
      inputDecorationTheme: AppTextFieldsTheme(colors),
      timePickerTheme: const TimePickerThemeData(),
      appBarTheme: CustomAppBarTheme(Brightness.light, colors),
      scaffoldBackgroundColor: colors.base10,
      iconTheme: IconThemeData(size: 24, color: colors.base800),
      switchTheme: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        thumbIcon: const WidgetStatePropertyAll(Icon(null)),
        thumbColor: WidgetStatePropertyAll(colors.base0),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary500;
          }
          return colors.base100;
        }),
        trackOutlineWidth: const WidgetStatePropertyAll(0),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: colors.base800),
      tabBarTheme: TabBarThemeData(
        indicatorColor: colors.primary500,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextStyle(fontSize: 14, fontFamily: 'Roboto').def(),
        unselectedLabelStyle: const TextStyle(fontSize: 14).def(),
        dividerColor: colors.base100,
        labelColor: colors.primary500,
        unselectedLabelColor: colors.base400,
        tabAlignment: TabAlignment.start,
      ),
      popupMenuTheme: AppPopupMenuTheme(colors),
      segmentedButtonTheme: AppSegmentedButtonTheme(colors),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: colors.base0,
      ),
      dialogTheme: AppDialogThemeData(colors),
      elevatedButtonTheme: AppElevatedButtonTheme(colors),
      textButtonTheme: DppTextButtonTheme(colors),
      bottomSheetTheme: AppBottomSheetTheme(colors),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary500;
          }
          return colors.base200;
        }),
      ),
      dividerTheme: DividerThemeData(color: colors.base100, space: 0),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        fillColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return colors.base200!.withValues(alpha: 0.32);
          } else if (states.contains(WidgetState.selected)) {
            return colors.primary500!;
          }
          return Colors.transparent;
        }),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: colors.base200!.withValues(alpha: 0.32));
          } else if (states.contains(WidgetState.error)) {
            return BorderSide(color: colors.danger500!);
          }
          return BorderSide(color: colors.base200!);
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        splashRadius: 0,
      ),
      listTileTheme: ListTileThemeData(
        horizontalTitleGap: 12,
        enableFeedback: false,
        dense: false,
        iconColor: colors.base800,
        leadingAndTrailingTextStyle: TextStyle(
          fontSize: 16,
          color: colors.base800,
          height: 1.5,
          fontWeight: FontWeight.w400,
        ).def(),
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: colors.base800,
          height: 1.5,
          fontWeight: FontWeight.w400,
        ).def(),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.zero,
        style: ListTileStyle.list,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          height: 1.33,
          color: colors.base800,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          color: colors.base800,
          height: 1.5,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          height: 1.33,
          color: colors.base800,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: colors.base800,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: colors.base800,
          height: 1.5,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: colors.base500,
          height: 1.28,
          fontWeight: FontWeight.w400,
        ),
      ).def(),
    );

    return MaterialApp(
      theme: lightTheme,
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset('assets/images/main_logo.png'),
        nextScreen: MainScreen(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: colors.baseGreen ?? Colors.white,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
