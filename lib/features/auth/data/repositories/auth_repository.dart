import 'package:flutter/foundation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';

import 'package:test_task_application/features/auth/data/data_sources/remote/auth_service.dart';
import 'package:test_task_application/features/auth/data/dto/auth_dto.dart';
import 'package:test_task_application/features/auth/domain/entities/auth_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class AuthRepository extends ChangeNotifier {
  final AuthService authService;
  AuthRepository(this.authService);
  Future<void> login({required AuthEntity authEntity}) async {
    try {
      await authService.login(
        body: AuthDto(
          username: authEntity.username,
          password: authEntity.password,
        ),
      );
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }
}
