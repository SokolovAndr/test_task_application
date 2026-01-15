part of 'product_item_bloc.dart';

@freezed
sealed class ProductItemEvent with _$ProductItemEvent {
  const factory ProductItemEvent.load() = _Load;
}