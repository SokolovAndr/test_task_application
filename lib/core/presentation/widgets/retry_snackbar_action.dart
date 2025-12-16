import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/generated/l10n.dart';

class RetrySnackbarAction extends StatelessWidget {
  const RetrySnackbarAction({
    super.key,
    required this.retryAction,
    required this.theme,
  });
  final ThemeData? theme;
  final VoidCallback retryAction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: retryAction,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        minimumSize: const WidgetStatePropertyAll(Size(100, 44)),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).extension<AppColors>()?.danger500,
        ),
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).extension<AppColors>()?.base100,
        ),
      ),
      child: Text(S.current.retry),
    );
  }
}
