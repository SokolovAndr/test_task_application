import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductsWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const ProductsWrapperScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
