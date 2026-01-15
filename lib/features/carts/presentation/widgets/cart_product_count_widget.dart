import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/generated/l10n.dart';

class CartProductCountWidget extends StatelessWidget {
  const CartProductCountWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(S.current.count, style: theme.textTheme.bodyMedium?.copyWith()),
        SizedBox(width: 8),
        Text(
          count.toString(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.extension<AppColors>()?.base800,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          S.current.pcs,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.extension<AppColors>()?.base800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
