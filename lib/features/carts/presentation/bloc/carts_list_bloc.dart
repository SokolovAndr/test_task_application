import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/carts/data/repositories/carts_repositories.dart';
import 'package:test_task_application/features/carts/domain/entities/carts_list_entity.dart';

part 'carts_list_bloc.freezed.dart';
part 'carts_list_event.dart';
part 'carts_list_state.dart';

class CartsListBloc extends Bloc<CartsListEvent, CartsListState> {
  CartsListBloc(this.cartsRepository, this.inAppNotificationRepository, this.id)
    : super(const _Initial()) {
    on<_Load>((event, emit) async {
      emit(const _Loading());
      await _load(event, emit);
    });
  }

  Future<void> _load(CartsListEvent event, Emitter<CartsListState> emit) async {
    try {
      final result = await cartsRepository.getUserCartsById(id: id);
      emit(_Loaded(carts: result));
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

  final int id;
  final CartsRepository cartsRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
