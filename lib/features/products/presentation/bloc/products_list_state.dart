part of 'products_list_bloc.dart';

@freezed
sealed class ProductsListState with _$ProductsListState {
  const factory ProductsListState.loading() = _Loading;
  const factory ProductsListState.loaded({
    required ProductsListEntity products,
  }) = _Loaded;
}
