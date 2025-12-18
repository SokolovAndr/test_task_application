import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task_application/generated/l10n.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  bool _isRouteActive(BuildContext context, PageRouteInfo route) {
    final currentRoute = context.router.current.route;
    return currentRoute.name == route.routeName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: SizedBox.shrink,
          finished: (model) => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.extension<AppColors>()!.baseGreen,
                  ),
                  child: ListTile(
                    title: Text(
                      S.current.app_title_short,
                      style: TextStyle(
                        color: theme.extension<AppColors>()!.baseWhite,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      S.current.app_title_full,
                      style: TextStyle(
                        color: theme.extension<AppColors>()!.baseWhite,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                _buildMenuItem(
                  context: context,
                  route: ProfileRoute(id: model.id),
                  icon: Icons.person,
                  label: S.current.profile,
                ),
                _buildMenuItem(
                  context: context,
                  route: const ProductsRoute(),
                  icon: Icons.list_alt,
                  label: S.current.products,
                ),
                _buildMenuItem(
                  context: context,
                  route: UsersRoute(id: model.id),
                  icon: Icons.group,
                  label: S.current.users,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required PageRouteInfo route,
    required IconData icon,
    required String label,
  }) {
    final isActive = _isRouteActive(context, route);
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? theme.extension<AppColors>()!.baseWhite
            : theme.extension<AppColors>()!.base970,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive
              ? theme.extension<AppColors>()!.baseWhite
              : theme.extension<AppColors>()!.base970,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isActive
          ? theme.extension<AppColors>()!.baseGreen
          : theme.extension<AppColors>()!.baseWhite,
      onTap: () {
        context.router.replace(route);
        Navigator.pop(context);
      },
    );
  }
}
