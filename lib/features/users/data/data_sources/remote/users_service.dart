import 'package:chopper/chopper.dart';
import 'package:test_task_application/features/users/data/dto/user_dto.dart';

part 'users_service.chopper.dart';

@ChopperApi()
abstract class UsersService extends ChopperService {
  static UsersService create([ChopperClient? client]) => _$UsersService(client);

  @GET(path: 'users')
  Future<Response<List<UserDto>>> getUsers();

  @GET(path: 'users/{id}')
  Future<Response<UserDto>> getUserById({@Path() required String id});
}
