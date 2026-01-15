import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';
import 'package:test_task_application/features/products/presentation/bloc/product_item_bloc.dart';
import 'package:test_task_application/features/products/presentation/widgets/product_item_rating_widget.dart';
import 'package:test_task_application/features/products/presentation/widgets/product_price_widget.dart';

import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({
    super.key,
    @PathParam('productId') required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.product)),
      body: BlocProvider(
        create: (context) =>
            ProductItemBloc(GetIt.I.get(), GetIt.I.get(), productId)
              ..add(ProductItemEvent.load()),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<ProductItemBloc, ProductItemState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => Content(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: theme
                              .extension<AppColors>()!
                              .primary40,
                          child: Text(
                            model.product.initials,
                            style: TextStyle(
                              color: theme.extension<AppColors>()!.baseGreen,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitledTextWidget(
                                title: S.current.title,
                                label: model.product.title,
                                fullText: true,
                              ),
                              SizedBox(height: 8),
                              TitledTextWidget(
                                title: S.current.category,
                                label: model.product.category,
                              ),
                              SizedBox(height: 8),
                              TitledTextWidget(
                                title: S.current.description,
                                label: model.product.description,
                                fullText: true,
                              ),
                              SizedBox(height: 8),
                              ProductItemRatingCountWidget(
                                rate: model.product.rating.rate,
                                count: model.product.rating.count,
                              ),
                              SizedBox(height: 8),
                              ProductPriceWidget(price: model.product.price),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<ProductItemBloc, ProductItemState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loading: () =>
                      const Positioned.fill(child: FullScreenLoadingWidget()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
