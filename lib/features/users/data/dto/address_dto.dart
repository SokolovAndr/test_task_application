import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/features/users/data/dto/geolocation_dto.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
sealed class AddressDto with _$AddressDto {
  const factory AddressDto({
    required GeolocationDto geolocation,
    required String city,
    required String street,
    required int number,
    required String zipcode,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}
