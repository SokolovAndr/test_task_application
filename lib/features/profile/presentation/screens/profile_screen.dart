import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, @PathParam('id') required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.profile)),
      drawer: AppDrawer(),
      body: BlocProvider(
        create: (context) =>
            ProfileBloc(GetIt.I.get(), GetIt.I.get(), id)
              ..add(ProfileEvent.load(id: id)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) =>
                  current.maybeWhen(orElse: () => false, loaded: (_) => true),
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (model) => Content(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: theme
                              .extension<AppColors>()!
                              .primary40,
                          child: Text(
                            model.user.initials,
                            style: TextStyle(
                              color: theme.extension<AppColors>()!.baseGreen,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme
                                        .extension<AppColors>()!
                                        .base100!,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.current.personal_data,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        TitledTextWidget(
                                          title: S.current.login,
                                          label: model.user.username,
                                        ),
                                        SizedBox(height: 8),
                                        TitledTextWidget(
                                          title: S.current.email,
                                          label: model.user.email,
                                        ),
                                        SizedBox(height: 8),
                                        TitledTextWidget(
                                          title: S.current.firstname,
                                          label: model.user.name.firstname,
                                        ),
                                        SizedBox(height: 8),
                                        TitledTextWidget(
                                          title: S.current.lastname,
                                          label: model.user.name.lastname,
                                        ),
                                        SizedBox(height: 8),
                                        TitledTextWidget(
                                          title: S.current.phone,
                                          label: model.user.phone,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme
                                        .extension<AppColors>()!
                                        .base100!,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: theme
                                              .extension<AppColors>()!
                                              .primary400!,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          S.current.address,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        SizedBox(width: 28),
                                        Text(
                                          S.current.city,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(model.user.address.city),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        SizedBox(width: 28),
                                        Text(
                                          S.current.street,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          S.current.street_home(
                                            model.user.address.street,
                                            model.user.address.number
                                                .toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        SizedBox(width: 28),
                                        Text(
                                          S.current.index,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(model.user.address.zipcode),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
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
