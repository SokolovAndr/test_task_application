import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/features/auth/presentation/screens/auth_screen.dart';
import 'package:test_task_application/features/carts/presentation/screens/cart_item_screen.dart';
import 'package:test_task_application/features/carts/presentation/screens/carts_screen.dart';
import 'package:test_task_application/features/products/presentation/screens/product_item_screen.dart';
import 'package:test_task_application/features/products/presentation/screens/products_screen.dart';
import 'package:test_task_application/features/profile/presentation/screens/profile_screen.dart';
import 'package:test_task_application/features/users/presentation/screens/users_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: AuthRoute.page, initial: true),
    AutoRoute(path: '/profile/:userId', page: ProfileRoute.page),
    AutoRoute(path: '/users/:userId', page: UsersRoute.page),
    AutoRoute(path: '/products', page: ProductsRoute.page),
    AutoRoute(path: '/products/:productId', page: ProductItemRoute.page),
    AutoRoute(path: '/carts', page: CartsRoute.page),
    AutoRoute(path: '/carts/:cartId', page: CartItemRoute.page),
  ];
}
