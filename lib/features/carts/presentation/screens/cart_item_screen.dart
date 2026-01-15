import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/carts/presentation/bloc/cart_item_bloc.dart';

import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class CartItemScreen extends StatelessWidget {
  const CartItemScreen({super.key, @PathParam('cartId') required this.cartId});

  final int cartId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.cart)),
      body: BlocProvider(
        create: (context) =>
            CartItemBloc(GetIt.I.get(), GetIt.I.get(), cartId)
              ..add(CartItemEvent.load(cartId: cartId)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<CartItemBloc, CartItemState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => Content(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitledTextWidget(
                                title: S.current.title,
                                label: model.cart.id.toString(),
                                fullText: true,
                              ),
                              SizedBox(height: 8),
                              TitledTextWidget(
                                title: S.current.category,
                                label: model.cart.date.toString(),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
