import 'package:flutter/material.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/features/users/presentation/widgets/users_list_item_titled_component_widget.dart';
import 'package:test_task_application/generated/l10n.dart';

class UsersListItemWidget extends StatelessWidget {
  const UsersListItemWidget({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Column(
        children: [
          UsersListItemTitledComponentWidget(
            title: S.current.firstname,
            label: user.name.firstname,
          ),
          SizedBox(height: 8),
          UsersListItemTitledComponentWidget(
            title: S.current.lastname,
            label: user.name.lastname,
          ),
          SizedBox(height: 8),
          UsersListItemTitledComponentWidget(
            title: S.current.phone,
            label: user.phone,
          ),
        ],
      ),
      onTap: () {
        debugPrint('testing widget');
      },
    );
  }
}
