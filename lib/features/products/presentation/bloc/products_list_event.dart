part of 'products_list_bloc.dart';

@freezed
sealed class ProductsListEvent with _$ProductsListEvent {
  const factory ProductsListEvent.load({Completer? completer}) = _Load;
}
