import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class CartsListItemWidget extends StatelessWidget {
  const CartsListItemWidget({super.key, required this.cart});

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      tileColor: theme.extension<AppColors>()!.baseWhite,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextWidget(
            title: S.current.date,
            label: S.current.date_format(cart.date),
          ),
          SizedBox(height: 8),
          TitledTextWidget(
            title: S.current.products_in_cart,
            label: cart.count,
          ),
        ],
      ),
      onTap: () {
        context.router.push(CartItemRoute(cartId: cart.id));
      },
    );
  }
}
