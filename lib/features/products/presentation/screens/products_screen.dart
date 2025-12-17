import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/features/products/presentation/bloc/products_list_bloc.dart';
import 'package:test_task_application/features/products/presentation/widgets/products_list_item_widget.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.products)),
      drawer: AppDrawer(),
      body: BlocProvider(
        create: (context) =>
            ProductsListBloc(GetIt.I.get(), GetIt.I.get())
              ..add(const ProductsListEvent.load()),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<ProductsListBloc, ProductsListState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final product = model.products.products[index];
                      return ProductsListItemWidget(product: product);
                    },
                    itemCount: model.products.totalCount,
                  ),
                );
              },
            ),
            BlocBuilder<ProductsListBloc, ProductsListState>(
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
