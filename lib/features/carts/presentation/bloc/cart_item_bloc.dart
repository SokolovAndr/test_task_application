import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/carts/data/repositories/carts_repositories.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_entity.dart';

part 'cart_item_bloc.freezed.dart';
part 'cart_item_event.dart';
part 'cart_item_state.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  CartItemBloc(
    this.cartsRepository,
    this.inAppNotificationRepository,
    this.cartId,
  ) : super(const _Initial()) {
    on<_Load>((event, emit) async {
      emit(const _Loading());
      await _load(event, emit);
    });
  }

  Future<void> _load(CartItemEvent event, Emitter<CartItemState> emit) async {
    try {
      final result = await cartsRepository.getCartById(cartId: cartId);
      emit(_Loaded(cart: result));
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

  final int cartId;
  final CartsRepository cartsRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}
