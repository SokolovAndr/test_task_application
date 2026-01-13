import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/features/carts/data/dto/cart_product_dto.dart';

part 'cart_dto.freezed.dart';
part 'cart_dto.g.dart';

@freezed
sealed class CartDto with _$CartDto {
  const factory CartDto({
    required int id,
    required int userId,
    required DateTime date,
    required List<CartProductDto> products,
  }) = _CartDto;

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}
