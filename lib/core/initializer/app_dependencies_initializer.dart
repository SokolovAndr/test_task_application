import 'package:test_task_application/core/initializer/chopper_client_initializer.dart';
import 'package:test_task_application/core/initializer/singlton_register_initializer.dart';

class AppDependenciesInitializer {
  static Future<void> initDependencies() async {
    final client = await ChopperClientInitializer.initChopperClient();
    await SingltonRegisterInitializer.registerDependencies(
      chopperClient: client,
    );
  }
}
