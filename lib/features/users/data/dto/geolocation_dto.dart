import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation_dto.freezed.dart';
part 'geolocation_dto.g.dart';

@freezed
sealed class GeolocationDto with _$GeolocationDto {
  const factory GeolocationDto({required String lat, required String long}) =
      _GeolocationDto;

  factory GeolocationDto.fromJson(Map<String, dynamic> json) =>
      _$GeolocationDtoFromJson(json);
}
