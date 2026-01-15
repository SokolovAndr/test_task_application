import 'package:chopper/chopper.dart';
import 'package:test_task_application/features/carts/data/dto/cart_dto.dart';

part 'carts_service.chopper.dart';

@ChopperApi()
abstract class CartsService extends ChopperService {
  static CartsService create([ChopperClient? client]) => _$CartsService(client);

  @GET(path: 'carts/user/{userId}')
  Future<Response<List<CartDto>>> getUserCartsById({
    @Path() required String userId,
  });

  @GET(path: 'carts/{cartId}')
  Future<Response<CartDto>> getCartById({@Path() required String cartId});
}
