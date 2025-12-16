import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/features/users/data/data_sources/remote/users_service.dart';
import 'package:test_task_application/features/users/data/repositories/users_repository.dart';

class SingltonRegisterInitializer {
  static Future<void> registerDependencies({
    required ChopperClient chopperClient,
  }) async {
    final inAppNotificationRepository = InAppNotificationRepository();

    final sl = GetIt.I;
    sl.registerSingleton(inAppNotificationRepository);

    sl.registerSingleton(UsersRepository(UsersService.create(chopperClient)));
  }
}
