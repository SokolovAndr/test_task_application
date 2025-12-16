import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/features/users/presentation/bloc/users_list_bloc.dart';
import 'package:test_task_application/features/users/presentation/widgets/users_list_item_widget.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.users)),
      drawer: AppDrawer(),
      body: BlocProvider(
        create: (context) =>
            UsersListBloc(GetIt.I.get(), GetIt.I.get())
              ..add(const UsersListEvent.load()),
        child: Stack(
          children: [
            BlocBuilder<UsersListBloc, UsersListState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final user = model.users.users[index];
                      return UsersListItemWidget(user: user);
                    },
                    itemCount: model.users.totalCount,
                  ),
                );
              },
            ),
            BlocBuilder<UsersListBloc, UsersListState>(
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
