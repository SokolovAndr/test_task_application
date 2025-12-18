import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';
import 'package:test_task_application/features/products/presentation/widgets/product_item_rating_widget.dart';
import 'package:test_task_application/features/products/presentation/widgets/product_price_widget.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProductsListItemWidget extends StatelessWidget {
  const ProductsListItemWidget({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: theme.extension<AppColors>()!.primary40,
        child: Text(
          product.initials,
          style: TextStyle(color: theme.extension<AppColors>()!.baseGreen),
        ),
      ),
      contentPadding: EdgeInsets.all(8),
      tileColor: theme.extension<AppColors>()!.baseWhite,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextWidget(title: S.current.title, label: product.title),
          SizedBox(height: 8),
          TitledTextWidget(title: S.current.category, label: product.category),
          SizedBox(height: 8),
          TitledTextWidget(
            title: S.current.description,
            label: product.description,
          ),
          SizedBox(height: 8),
          ProductItemRatingCountWidget(
            rate: product.rating.rate,
            count: product.rating.count,
          ),
          SizedBox(height: 8),
          ProductPriceWidget(price: product.price),
        ],
      ),
      onTap: () {
        context.router.push(ProductItemRoute(productId: product.id));
      },
    );
  }
}
