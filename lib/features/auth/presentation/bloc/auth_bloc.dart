import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/auth/data/repositories/auth_repository.dart';
import 'package:test_task_application/features/auth/domain/entities/auth_entity.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository, this.inAppNotificationRepository)
    : super(const _Initial()) {
    on<_Login>((event, emit) async {
      final s = state;
      emit(const _Loading());
      try {
        await authRepository.login(
          authEntity: event.auth,
        );
        emit(const _Finished(id: 10));
      } on ResourceError catch (e) {
        emit(s);
        await inAppNotificationRepository.addError(
          ErrorEntity(
            error: e.description,
            retryAction: () {
              if (!isClosed) {
                add(event);
              }
            },
          ),
        );
      } on RequestError catch (e) {
        emit(s);
        await inAppNotificationRepository.addError(
          ErrorEntity(
            error: e.description,
            retryAction: () {
              if (!isClosed) {
                add(event);
              }
            },
          ),
        );
      }
    });
  }

  final AuthRepository authRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
