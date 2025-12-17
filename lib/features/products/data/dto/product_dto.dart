import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/features/products/data/dto/rating_dto.dart';


part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
sealed class ProductDto with _$ProductDto {
  const factory ProductDto({
     required int id,
     required String title,
     required double price,
     required String description,
     required String category,
     required String image,
     required RatingDto rating,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
