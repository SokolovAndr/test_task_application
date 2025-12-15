import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/themes/font_family.dart';
import 'package:test_task_application/generated/l10n.dart';

class ErrorSnackbar extends StatelessWidget {
  const ErrorSnackbar({
    super.key,
    required this.text,
    this.action,
    this.theme,
    required this.closeAction,
  });

  final String text;
  final Widget? action;
  final ThemeData? theme;
  final VoidCallback closeAction;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme?.colorScheme.error,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: theme?.colorScheme.onError).def(),
                  ),
                  if (action != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [const SizedBox(height: 12), action!],
                    ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: closeAction,
            icon: Icon(
              Icons.close,
              color: theme?.extension<AppColors>()?.base0,
            ),
          ),
        ],
      ),
    );
  }
}

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
