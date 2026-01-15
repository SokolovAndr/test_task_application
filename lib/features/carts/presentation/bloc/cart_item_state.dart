part of 'cart_item_bloc.dart';

@freezed
sealed class CartItemState with _$CartItemState {
  const factory CartItemState.initial() = _Initial;
  const factory CartItemState.loading() = _Loading;
  const factory CartItemState.loaded({required CartEntity cart}) =
      _Loaded;
}
