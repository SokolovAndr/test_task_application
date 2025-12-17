import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/products/data/repositories/products_repository.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';
import 'package:test_task_application/features/products/domain/entities/products_list_entity.dart';


part 'products_list_bloc.freezed.dart';
part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.productsRepository, this.inAppNotificationRepository)
    : super(const _Loading()) {
    //productsRepository.addListener(_update); //TODO Убрать или доработать
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
          final newList = [...model.products.products];
          newList[event.index] = event.entity;
          emit(model.copyWith(products: model.products.copyWith(products: newList)));
        },
      );
    });
    on<_LoadMore>((event, emit) async {
      await _loadMore(event, emit);
    });
  }

  Future<void> _loadMore(
    ProductsListEvent event,
    Emitter<ProductsListState> emit, {
    Completer? completer,
  }) async {
    final s = state;
    emit(const _Loading());
    try {
      await state.mapOrNull(
        loaded: (model) async {
          ++page;
          final result = await productsRepository.getProducts(page: page);
          completer?.complete();
          emit(
            model.copyWith(
              products: model.products.copyWith(
                totalCount: result.totalCount,
                products: [...model.products.products, ...result.products],
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
    ProductsListEvent event,
    Emitter<ProductsListState> emit, {

    Completer? completer,
  }) async {
    try {
      page = 0;
      final result = await productsRepository.getProducts(page: page);
      completer?.complete();
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

  /*void _update() {
    state.maybeMap(
      loaded: (model) {
        add(_Load());
      },
      orElse: () => add(const _Load()),
    );
  }*/
  //TODO Убрать или доработать

  final ProductsRepository productsRepository;
  final InAppNotificationRepository inAppNotificationRepository;
  int page = 0;
}
