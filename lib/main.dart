import 'package:flutter/material.dart';
import 'package:test_task_application/core/app.dart';
import 'package:test_task_application/core/initializer/app_dependencies_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependenciesInitializer.initDependencies();
  runApp(const App());
}
