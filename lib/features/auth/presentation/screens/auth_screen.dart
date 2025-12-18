import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/default_input_decoration.dart';
import 'package:test_task_application/core/presentation/widgets/fullscreen_loading_widget.dart';
import 'package:test_task_application/core/presentation/widgets/scrollable_fill_screen.dart';
import 'package:test_task_application/core/presentation/widgets/titled_field_block.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/core/utils/validators/form_model_submit.dart';
import 'package:test_task_application/features/auth/domain/entities/auth_entity.dart';
import 'package:test_task_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task_application/features/auth/presentation/screens/models/auth_model.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AuthModelFormBuilder(
      builder: (BuildContext context, AuthModelForm formModel, Widget? child) =>
          Stack(
            fit: StackFit.expand,
            children: [
              Scaffold(
                body: ReactiveAuthModelFormConsumer(
                  builder:
                      (
                        BuildContext context,
                        AuthModelForm formModel,
                        Widget? child,
                      ) => BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            finished: (id) {
                              context.router.replace(ProfileRoute(id: id));
                            },
                          );
                        },
                        builder: (context, state) {
                          return Content(
                            child: ScrollableFillScreen(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 150),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: theme
                                        .extension<AppColors>()!
                                        .baseGreen,
                                    child: Text(
                                      S.current.app_title_short,
                                      style: TextStyle(
                                        color: theme
                                            .extension<AppColors>()!
                                            .baseWhite,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    S.current.app_title_full,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  TitledFieldBlock(
                                    title: S.current.login,
                                    child: ReactiveTextField(
                                      decoration: DefaultInputDecoration.def,
                                      formControl: formModel.usernameControl,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TitledFieldBlock(
                                    title: S.current.password,
                                    child: ReactiveTextField(
                                      obscureText: true,

                                      formControl: formModel.passwordControl,
                                      decoration: DefaultInputDecoration.def,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            formModel.currentForm.valid
                                            ? AppColors.light.baseGreen
                                            : AppColors.light.success100,
                                      ),
                                      onPressed: () =>
                                          formModel.validateAndSubmit(
                                            (model) =>
                                                context.read<AuthBloc>().add(
                                                  AuthEvent.login(
                                                    auth: _modelToEntity(model),
                                                  ),
                                                ),
                                          ),

                                      child: Text(S.current.login_action),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
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
    );
  }

  AuthEntity _modelToEntity(AuthModel model) =>
      AuthEntity(username: model.username, password: model.password);
}
