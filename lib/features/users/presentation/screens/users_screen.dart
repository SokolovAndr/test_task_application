import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_application/core/presentation/widgets/app_drawer.dart';

@RoutePage()
class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UsersScreen')),
      drawer: AppDrawer(),
      body: Center(child: Text('Это UsersScreen')),
    );
  }
}
