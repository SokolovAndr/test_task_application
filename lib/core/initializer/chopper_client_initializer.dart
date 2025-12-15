import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/api/base_headers_interceptor.dart';
import 'package:test_task_application/core/api/base_response_converter.dart';
import 'package:test_task_application/core/api/persistent_connection.dart';
import 'package:test_task_application/features/users/data/dto/address_dto.dart';
import 'package:test_task_application/features/users/data/dto/geolocation_dto.dart';
import 'package:test_task_application/features/users/data/dto/name_dto.dart';
import 'package:test_task_application/features/users/data/dto/user_dto.dart';

class ChopperClientInitializer {
  static Future<ChopperClient> initChopperClient() async {
    const converter = BaseResponseConverter({
      UserDto: UserDto.fromJson,
      NameDto: NameDto.fromJson,
      GeolocationDto: GeolocationDto.fromJson,
      AddressDto: AddressDto.fromJson,
    });

    final chopperClient = ChopperClient(
      client: PersistentConnection(),
      //baseUrl: Uri.tryParse(AppEnv().baseUrl), //TODO: доделать или убрать
      baseUrl: Uri.tryParse(
        'https://fakestoreapi.com',
      ),
      interceptors: [
        const BaseHeadersInterceptor(),
        HttpLoggingInterceptor(),
        if (kDebugMode) CurlInterceptor(),
      ],
      converter: converter,
      errorConverter: converter,
    );

    final sl = GetIt.I;
    sl.registerSingleton(converter);

    return chopperClient;
  }
}
