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
class CartItemScreen extends StatelessWidget {
  const CartItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.product)),
      body: Content(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('CartItemScreen')],
        ),
      ),
    );
  }
}
