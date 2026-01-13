import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_dto.freezed.dart';
part 'cart_product_dto.g.dart';

@freezed
sealed class CartProductDto with _$CartProductDto {
  const factory CartProductDto({
    required int productId,
    required int quantity,
  }) = _CartProductDto;

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}
