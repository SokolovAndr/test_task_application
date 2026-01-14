import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartsWrapperScreen extends AutoRouter implements AutoRouteWrapper {
  const CartsWrapperScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
