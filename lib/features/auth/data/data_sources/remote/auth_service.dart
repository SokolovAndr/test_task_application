import 'package:chopper/chopper.dart';
import 'package:test_task_application/features/auth/data/dto/auth_dto.dart';
import 'package:test_task_application/features/auth/data/dto/token_dto.dart';

part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @POST(path: 'auth/login')
  Future<Response<TokenDto>> login({@Body() required AuthDto body});
}
