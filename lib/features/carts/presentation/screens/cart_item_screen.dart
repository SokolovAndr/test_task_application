import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/carts/presentation/bloc/cart_item_bloc.dart';
import 'package:test_task_application/features/carts/presentation/widgets/cart_product_count_widget.dart';
import 'package:test_task_application/features/carts/presentation/widgets/cart_product_price_widget.dart';
import 'package:test_task_application/features/carts/presentation/widgets/cart_product_total_price_widget.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class CartItemScreen extends StatelessWidget {
  const CartItemScreen({super.key, @PathParam('cartId') required this.cartId});

  final int cartId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.cart_detail)),
      body: BlocProvider(
        create: (context) =>
            CartItemBloc(cartId, GetIt.I.get(), GetIt.I.get(), GetIt.I.get())
              ..add(CartItemEvent.load()),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<CartItemBloc, CartItemState>(
              buildWhen: (previous, current) => current.maybeWhen(
                orElse: () => false,
                loaded: (_, _) => true,
              ),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) {
                    return Content(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitledTextWidget(
                                title: S.current.date,
                                label: S.current.date_format(model.cart.date),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: BoxBorder.all(
                                    color: theme
                                        .extension<AppColors>()!
                                        .base100!,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    shrinkWrap: true,
                                    itemCount: model.cart.products.length,
                                    itemBuilder: (context, index) {
                                      final product =
                                          model.detailedProducts[index];
                                      final count =
                                          model.cart.products[index].quantity;
                                      final totalPrice = count * product.price;

                                      return ListTile(
                                        onTap: () {
                                          context.router.push(
                                            ProductItemRoute(
                                              productId: product.id,
                                            ),
                                          );
                                        },
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: theme
                                              .extension<AppColors>()!
                                              .primary40,
                                          child: Text(
                                            product.initials,
                                            style: TextStyle(
                                              color: theme
                                                  .extension<AppColors>()!
                                                  .baseGreen,
                                            ),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.all(8),
                                        tileColor: theme
                                            .extension<AppColors>()!
                                            .baseWhite,
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.title,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: theme
                                                        .extension<AppColors>()
                                                        ?.base800,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            SizedBox(height: 8),
                                            CartProductPriceWidget(
                                              price: product.price,
                                            ),
                                            SizedBox(height: 8),
                                            CartProductCountWidget(
                                              count: count,
                                            ),
                                            SizedBox(height: 8),
                                            CartProductTotalPriceWidget(
                                              totalPrice: totalPrice,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<CartItemBloc, CartItemState>(
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
