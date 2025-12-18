import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/products/data/repositories/products_repository.dart';
import 'package:test_task_application/features/products/domain/entities/products_list_entity.dart';

part 'products_list_bloc.freezed.dart';
part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.productsRepository, this.inAppNotificationRepository)
    : super(const _Initial()) {
    on<_Load>((event, emit) async {
      emit(const _Loading());
      await _load(event, emit);
    });
  }

  Future<void> _load(
    ProductsListEvent event,
    Emitter<ProductsListState> emit,
  ) async {
    try {
      final result = await productsRepository.getProducts();
      emit(_Loaded(products: result));
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

  final ProductsRepository productsRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
