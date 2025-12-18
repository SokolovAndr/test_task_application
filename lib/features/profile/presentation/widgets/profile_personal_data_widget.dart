import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProfilePersonalDataWidget extends StatelessWidget {
  const ProfilePersonalDataWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.extension<AppColors>()!.base100!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.personal_data,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              TitledTextWidget(title: S.current.login, label: user.username),
              SizedBox(height: 8),
              TitledTextWidget(title: S.current.email, label: user.email),
              SizedBox(height: 8),
              TitledTextWidget(
                title: S.current.firstname,
                label: user.name.firstname,
              ),
              SizedBox(height: 8),
              TitledTextWidget(
                title: S.current.lastname,
                label: user.name.lastname,
              ),
              SizedBox(height: 8),
              TitledTextWidget(title: S.current.phone, label: user.phone),
            ],
          ),
        ],
      ),
    );
  }
}
