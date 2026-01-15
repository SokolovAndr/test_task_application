import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/generated/l10n.dart';

class CartProductTotalPriceWidget extends StatelessWidget {
  const CartProductTotalPriceWidget({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          S.current.total_price,
          style: theme.textTheme.bodyMedium?.copyWith(),
        ),
        SizedBox(width: 8),
        Text(
          S.current.price_usd(totalPrice),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.extension<AppColors>()?.base800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
