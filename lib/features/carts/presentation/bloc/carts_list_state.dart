part of 'carts_list_bloc.dart';

@freezed
sealed class CartsListState with _$CartsListState {
  const factory CartsListState.initial() = _Initial;
  const factory CartsListState.loading() = _Loading;
  const factory CartsListState.loaded({required CartsListEntity carts}) =
      _Loaded;
}
