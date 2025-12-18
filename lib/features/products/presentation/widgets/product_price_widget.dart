import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      S.current.price_usd(price),
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.extension<AppColors>()?.base800,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
