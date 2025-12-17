
import 'package:auto_route/auto_route.dart';
import 'package:test_task_application/features/auth/presentation/screens/auth_screen.dart';
import 'package:test_task_application/features/products/presentation/screens/products_screen.dart';
import 'package:test_task_application/features/profile/presentation/screens/profile_screen.dart';
import 'package:test_task_application/features/users/presentation/screens/users_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, initial: true),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ProductsRoute.page),
    AutoRoute(page: UsersRoute.page),
  ];
}
