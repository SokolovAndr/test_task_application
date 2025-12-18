import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/users/data/repositories/users_repository.dart';
import 'package:test_task_application/features/users/domain/entities/users_list_entity.dart';

part 'users_list_bloc.freezed.dart';
part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc(this.usersRepository, this.inAppNotificationRepository)
    : super(const _Initial()) {
    on<_Load>((event, emit) async {
      emit(const _Loading());
      await _load(event, emit);
    });
  }

  Future<void> _load(UsersListEvent event, Emitter<UsersListState> emit) async {
    try {
      final result = await usersRepository.getUsers();
      emit(_Loaded(users: result));
    } on ResourceError catch (e) {
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
  }

  final UsersRepository usersRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
