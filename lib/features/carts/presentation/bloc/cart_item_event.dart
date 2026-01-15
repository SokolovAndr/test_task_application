part of 'cart_item_bloc.dart';

@freezed
sealed class CartItemEvent with _$CartItemEvent {
  const factory CartItemEvent.load() = _Load;
}
