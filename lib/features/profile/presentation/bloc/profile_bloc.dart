import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/users/data/repositories/users_repository.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.usersRepository, this.inAppNotificationRepository, this.id)
    : super(const _Loading()) {
    on<_Load>((event, emit) async {
      final s = state;
      emit(const _Loading());
      try {
        final user = await usersRepository.getUserById(id: id);
        emit(_Loaded(user: user));
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
  final int id;
  final UsersRepository usersRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
