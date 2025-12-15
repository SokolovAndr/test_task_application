import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/features/users/data/dto/address_dto.dart';
import 'package:test_task_application/features/users/data/dto/name_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
sealed class UserDto with _$UserDto {
  const factory UserDto({
    required AddressDto address,
    required int id,
    required String email,
    required String username,
    required String password,
    required NameDto name,
    required String phone,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
