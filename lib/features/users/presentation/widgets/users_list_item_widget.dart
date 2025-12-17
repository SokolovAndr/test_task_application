import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/titled_text_widget.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class UsersListItemWidget extends StatelessWidget {
  const UsersListItemWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: theme.extension<AppColors>()!.primary40,
        child: Text(
          user.initials,
          style: TextStyle(color: theme.extension<AppColors>()!.baseGreen),
        ),
      ),
      contentPadding: EdgeInsets.all(8),
      tileColor: theme.extension<AppColors>()!.baseWhite,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      onTap: () {
        debugPrint('testing widget');
      },
    );
  }
}
