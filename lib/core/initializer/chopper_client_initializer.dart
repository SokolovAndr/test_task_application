import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_application/core/api/base_headers_interceptor.dart';
import 'package:test_task_application/core/api/base_response_converter.dart';
import 'package:test_task_application/core/api/persistent_connection.dart';
import 'package:test_task_application/features/auth/data/dto/auth_dto.dart';
import 'package:test_task_application/features/auth/data/dto/token_dto.dart';
import 'package:test_task_application/features/carts/data/dto/cart_dto.dart';
import 'package:test_task_application/features/carts/data/dto/cart_product_dto.dart';
import 'package:test_task_application/features/products/data/dto/product_dto.dart';
import 'package:test_task_application/features/products/data/dto/rating_dto.dart';
import 'package:test_task_application/features/users/data/dto/address_dto.dart';
import 'package:test_task_application/features/users/data/dto/geolocation_dto.dart';
import 'package:test_task_application/features/users/data/dto/name_dto.dart';
import 'package:test_task_application/features/users/data/dto/user_dto.dart';

class ChopperClientInitializer {
  static Future<ChopperClient> initChopperClient() async {
    await dotenv.load();
    const converter = BaseResponseConverter({
      UserDto: UserDto.fromJson,
      NameDto: NameDto.fromJson,
      GeolocationDto: GeolocationDto.fromJson,
      AddressDto: AddressDto.fromJson,
      ProductDto: ProductDto.fromJson,
      RatingDto: RatingDto.fromJson,
      AuthDto: AuthDto.fromJson,
      TokenDto: TokenDto.fromJson,
      CartDto: CartDto.fromJson,
      CartProductDto: CartProductDto.fromJson,
    });
    final baseUrl = dotenv.get('BASE_URL');

    final chopperClient = ChopperClient(
      client: PersistentConnection(),
      baseUrl: Uri.tryParse(baseUrl),
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
