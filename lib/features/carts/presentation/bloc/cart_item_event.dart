part of 'cart_item_bloc.dart';

@freezed
sealed class CartItemEvent with _$CartItemEvent {
  const factory CartItemEvent.load({required int? cartId}) = _Load;
}
