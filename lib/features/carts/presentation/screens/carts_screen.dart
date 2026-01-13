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
class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key, @PathParam('id') required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.cart)),
      drawer: AppDrawer(),
      body: Center(child: Text(S.current.cart + id.toString())),
    );
  }
}
