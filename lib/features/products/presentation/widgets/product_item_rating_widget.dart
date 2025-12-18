import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProductItemRatingCountWidget extends StatelessWidget {
  const ProductItemRatingCountWidget({
    super.key,
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        StarRating(
          size: 20.0,
          rating: rate,
          color: theme.extension<AppColors>()!.baseGreen,
          borderColor: theme.extension<AppColors>()!.base500,
          allowHalfRating: true,
          onRatingChanged: (rate) => {},
        ),
        SizedBox(width: 8),
        Text(rate.toString()),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(S.current.stock(count)),
        ),
      ],
    );
  }
}
