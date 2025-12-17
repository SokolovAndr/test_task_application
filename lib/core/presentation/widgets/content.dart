import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 24),
    this.margin = EdgeInsets.zero,
    this.child,
    this.bottomLine = false,
    this.hideKeyboardOnOuterTap = true,
    this.safe = true,
  });

  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool bottomLine;
  final bool hideKeyboardOnOuterTap;
  final bool safe;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      top: safe,
      bottom: safe,
      left: safe,
      right: safe,
      child: GestureDetector(
        onTap: () => hideKeyboardOnOuterTap
            ? FocusManager.instance.primaryFocus?.unfocus()
            : null,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).extension<AppColors>()?.base0,
            border: bottomLine
                ? Border(
                    bottom: BorderSide(
                      color: theme.extension<AppColors>()!.base100!,
                    ),
                  )
                : null,
          ),
          padding: padding,
          margin: margin,
          child: child,
        ),
      ),
    );
  }
}
