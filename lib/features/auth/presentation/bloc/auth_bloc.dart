import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/auth/data/repositories/auth_repository.dart';
import 'package:test_task_application/features/auth/domain/entities/auth_entity.dart';
import 'package:test_task_application/features/users/data/repositories/users_repository.dart';
import 'package:collection/collection.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.authRepository,
    this.inAppNotificationRepository,
    this.usersRepository,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      final s = state;
      emit(const _Loading());
      try {
        await authRepository.login(authEntity: event.auth);
        final usersList = await usersRepository.getUsers();
        final currentUser = usersList.users.firstWhereOrNull(
          (user) =>
              user.username == event.auth.username &&
              user.password == event.auth.password,
        );
        emit(_Finished(id: currentUser?.id ?? 0));
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
  final UsersRepository usersRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
