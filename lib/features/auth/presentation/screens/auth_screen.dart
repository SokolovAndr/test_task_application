import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_task_application/core/presentation/widgets/content.dart';
import 'package:test_task_application/core/presentation/widgets/default_input_decoration.dart';
import 'package:test_task_application/core/presentation/widgets/titled_field_block.dart';
import 'package:test_task_application/core/routing/app_router.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/auth/presentation/screens/models/auth_model.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  // context.router.replace(const ProfileRoute());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.app_title_short), centerTitle: true),
      body: AuthModelFormBuilder(
        builder:
            (BuildContext context, AuthModelForm formModel, Widget? child) =>
                Center(
                  child: Content(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: theme
                              .extension<AppColors>()!
                              .baseGreen,
                          child: Text(
                            S.current.app_title_short,
                            style: TextStyle(
                              color: theme.extension<AppColors>()!.baseWhite,
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
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                           // context.router.replace(const ProfileRoute());
                          },
                          child: Text(S.current.login_action),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
