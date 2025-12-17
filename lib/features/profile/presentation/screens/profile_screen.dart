import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';
import 'package:test_task_application/generated/l10n.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, @PathParam('id') required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.profile)),
      drawer: AppDrawer(),
      body: Center(child: Text('Это ProfileScreen для юзера с id: $id')),
    );
  }
}
