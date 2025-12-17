part of 'products_list_bloc.dart';

@freezed
sealed class ProductsListEvent with _$ProductsListEvent {
  const factory ProductsListEvent.loadMore({Completer? completer}) = _LoadMore;

  const factory ProductsListEvent.load({Completer? completer}) = _Load;

  const factory ProductsListEvent.updateLocal({
    required ProductEntity entity,
    required int index,
  }) = _UpdateLocal;
}
