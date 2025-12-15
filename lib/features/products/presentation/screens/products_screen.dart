import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.products)),
      drawer: AppDrawer(),
      body: Center(child: Text('Это ProductsScreen')),
    );
  }
}
