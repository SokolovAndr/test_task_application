import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';

class AppElevatedButtonTheme extends ElevatedButtonThemeData {
  AppElevatedButtonTheme(AppColors colors)
    : super(
        style: ElevatedButton.styleFrom(
          foregroundColor: colors.base0,
          backgroundColor: colors.baseGreen,
          elevation: 0,
          disabledForegroundColor: colors.base0,
          disabledBackgroundColor: colors.primary200,
          minimumSize: const Size.fromHeight(44),
          shadowColor: Colors.transparent,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            height: 1,
            fontWeight: FontWeight.w400,
          ).def(),
        ),
      );
}

class AppTextButtonTheme extends TextButtonThemeData {
  AppTextButtonTheme(AppColors colors)
    : super(
        style:
            TextButton.styleFrom(
              padding: const EdgeInsets.all(3),
              elevation: 0,
              minimumSize: Size.zero,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: colors.primary500,
              splashFactory: NoSplash.splashFactory,
              textStyle: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                height: 1.28,
                fontWeight: FontWeight.w400,
              ).def(),
            ).copyWith(
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            ),
      );
}

extension ElevatedButtonGray on ElevatedButton {
  static ElevatedButton secondary(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Theme.of(context).extension<AppColors>()!.base400!;
        } else {
          return Theme.of(context).extension<AppColors>()!.base800!;
        }
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Theme.of(context).extension<AppColors>()!.base10!;
        } else {
          return Theme.of(context).extension<AppColors>()!.base100!;
        }
      }),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}

extension ElevatedButtonOutlined on ElevatedButton {
  static ElevatedButton outlinedDefault(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Theme.of(context).extension<AppColors>()!.base400!;
        } else {
          return Theme.of(context).extension<AppColors>()!.base800!;
        }
      }),
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.baseWhite,
      ),
      shape: WidgetStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: states.contains(WidgetState.disabled)
                ? Theme.of(context).extension<AppColors>()!.base400!
                : Theme.of(context).extension<AppColors>()!.base200!,
          ),
        );
      }),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
  static ElevatedButton outlined(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Theme.of(context).extension<AppColors>()!.base400!;
        } else {
          return Theme.of(context).extension<AppColors>()!.primary500!;
        }
      }),
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.baseWhite,
      ),
      shape: WidgetStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: states.contains(WidgetState.disabled)
                ? Theme.of(context).extension<AppColors>()!.base400!
                : Theme.of(context).extension<AppColors>()!.primary500!,
          ),
        );
      }),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}

extension ElevatedButtonLight on ElevatedButton {
  static ElevatedButton light(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => switch (states.toList()) {
          [WidgetState.disabled] => Theme.of(
            context,
          ).extension<AppColors>()?.primary300,
          [...] => Theme.of(context).extension<AppColors>()?.base0,
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => switch (states.toList()) {
          [WidgetState.disabled] => Theme.of(
            context,
          ).extension<AppColors>()?.base0,
          [...] => Theme.of(context).extension<AppColors>()?.primary500,
        },
      ),
      shape: WidgetStateProperty.resolveWith(
        (states) => switch (states.toList()) {
          [WidgetState.disabled] => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: Theme.of(context).extension<AppColors>()!.primary500!,
            ),
          ),
          [...] => null,
        },
      ),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}

extension ElevatedButtonError on ElevatedButton {
  static ElevatedButton secondary(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.base0,
      ),
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.danger500,
      ),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}

extension ElevatedButtonFab on ElevatedButton {
  static ElevatedButton fab(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
    Color? activeBackgroundColor,
    Color? disabledBackgroundColor,
    double size = 40,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      foregroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.base0,
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledBackgroundColor ??
              Theme.of(context).extension<AppColors>()?.primary200;
        } else {
          return activeBackgroundColor ??
              Theme.of(context).extension<AppColors>()?.primary500;
        }
      }),
      maximumSize: WidgetStatePropertyAll(Size(size, size)),
      minimumSize: WidgetStatePropertyAll(Size(size, size)),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}

extension ElevatedButtonFabGrayed on ElevatedButton {
  static ElevatedButton fabGrayed(
    BuildContext context, {
    Key? key,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    required Widget? child,
  }) => ElevatedButton(
    key: key,
    onPressed: onPressed,
    onLongPress: onLongPress,
    onHover: onHover,
    onFocusChange: onFocusChange,
    style: ButtonStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      foregroundColor: WidgetStatePropertyAll(
        Theme.of(context).extension<AppColors>()?.base0,
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Theme.of(context).extension<AppColors>()?.base10;
        } else {
          return Theme.of(context).extension<AppColors>()?.base100;
        }
      }),
      maximumSize: const WidgetStatePropertyAll(Size(40, 40)),
      minimumSize: const WidgetStatePropertyAll(Size(40, 40)),
    ).merge(style),
    focusNode: focusNode,
    autofocus: autofocus,
    clipBehavior: clipBehavior,
    statesController: statesController,
    child: child,
  );
}
