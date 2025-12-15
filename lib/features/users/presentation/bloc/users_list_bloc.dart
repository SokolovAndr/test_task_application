import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/users/data/repositories/users_repository.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/features/users/domain/entities/users_list_entity.dart';

part 'users_list_bloc.freezed.dart';
part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc(this.usersRepository, this.inAppNotificationRepository)
    : super(const _Loading()) {
    //usersRepository.addListener(_update); //TODO Убрать или доработать
    on<_Load>((event, emit) async {
      if (event.completer == null) {
        emit(const _Loading());
      }
      await _load(event, emit);
      event.completer?.complete();
    });
    on<_UpdateLocal>((event, emit) async {
      state.mapOrNull(
        loaded: (model) {
          final newList = [...model.users.users];
          newList[event.index] = event.entity;
          emit(model.copyWith(users: model.users.copyWith(users: newList)));
        },
      );
    });
    on<_LoadMore>((event, emit) async {
      await _loadMore(event, emit);
    });
  }

  Future<void> _loadMore(
    UsersListEvent event,
    Emitter<UsersListState> emit, {
    Completer? completer,
  }) async {
    final s = state;
    emit(const _Loading());
    try {
      await state.mapOrNull(
        loaded: (model) async {
          ++page;
          final result = await usersRepository.getUsers(page: page);
          completer?.complete();
          emit(
            model.copyWith(
              users: model.users.copyWith(
                totalCount: result.totalCount,
                users: [...model.users.users, ...result.users],
              ),
            ),
          );
        },
      );
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
  }

  Future<void> _load(
    UsersListEvent event,
    Emitter<UsersListState> emit, {

    Completer? completer,
  }) async {
    try {
      page = 0;
      final result = await usersRepository.getUsers(page: page);
      completer?.complete();
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

  /*void _update() {
    state.maybeMap(
      loaded: (model) {
        add(_Load());
      },
      orElse: () => add(const _Load()),
    );
  }*/
  //TODO Убрать или доработать

  final UsersRepository usersRepository;
  final InAppNotificationRepository inAppNotificationRepository;
  int page = 0;
}
