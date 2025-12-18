import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(S.current.profile)),
      body: Center(child: Text(productId.toString())),
    );
  }
}
