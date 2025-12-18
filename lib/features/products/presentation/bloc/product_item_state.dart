part of 'product_item_bloc.dart';

@freezed
sealed class ProductItemState with _$ProductItemState {
  const factory ProductItemState.loaded({required ProductEntity product}) =
      _Loaded;
  const factory ProductItemState.loading() = _Loading;
}
