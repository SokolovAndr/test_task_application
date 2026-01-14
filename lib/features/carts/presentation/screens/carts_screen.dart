import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/features/carts/presentation/bloc/carts_list_bloc.dart';
import 'package:test_task_application/features/carts/presentation/widgets/carts_list_item_widget.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key, @PathParam('id') required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.cart)),
      drawer: AppDrawer(),
      body: BlocProvider(
        create: (context) =>
            CartsListBloc(GetIt.I.get(), GetIt.I.get(), id)
              ..add(const CartsListEvent.load()),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<CartsListBloc, CartsListState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final cart = model.carts.carts[index];
                      return CartsListItemWidget(cart: cart);
                    },
                    itemCount: model.carts.quantity,
                  ),
                );
              },
            ),
            BlocBuilder<CartsListBloc, CartsListState>(
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
