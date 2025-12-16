import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/features/users/data/data_sources/remote/users_service.dart';
import 'package:test_task_application/features/users/data/dto/address_dto.dart';
import 'package:test_task_application/features/users/data/dto/geolocation_dto.dart';
import 'package:test_task_application/features/users/data/dto/name_dto.dart';
import 'package:test_task_application/features/users/domain/entities/address_entity.dart';
import 'package:test_task_application/features/users/domain/entities/geolocation_entity.dart';
import 'package:test_task_application/features/users/domain/entities/name_entity.dart';
import 'package:test_task_application/features/users/domain/entities/user_entity.dart';
import 'package:test_task_application/features/users/domain/entities/users_list_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class UsersRepository {
  UsersRepository(this.usersService);

  static const int limit = 10; //TODO или 50?

  final UsersService usersService;

  Future<UsersListEntity> getUsers({int page = 0}) async {
    try {
      final response = await usersService.getUsers();
      if (response.resourceError != null) {
        throw response.resourceError!;
      }
      final body = response.body!;

      final users = body
          .map(
            (user) => UserEntity(
              address: user.address.map(
                (address) => AddressEntity(
                  geolocation: address.geolocation.map(
                    (geolocation) => GeolocationEntity(
                      lat: geolocation.lat,
                      long: geolocation.long,
                    ),
                  ),
                  city: address.city,
                  street: address.street,
                  number: address.number,
                  zipcode: address.zipcode,
                ),
              ),
              id: user.id,
              email: user.email,
              username: user.username,
              password: user.password,
              name: user.name.map(
                (name) => NameEntity(
                  firstname: name.firstname,
                  lastname: name.lastname,
                ),
              ),
              phone: user.phone,
            ),
          )
          .toList();
      return UsersListEntity(users: users, totalCount: users.length);
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }
}
