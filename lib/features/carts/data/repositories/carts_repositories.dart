import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/features/carts/data/data_sources/remote/carts_service.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_entity.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_product_entity.dart';
import 'package:test_task_application/features/carts/domain/entities/carts_list_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class CartsRepository {
  CartsRepository(this.cartsService);

  final CartsService cartsService;

  Future<CartsListEntity> getUserCartsById({required int id}) async {
    try {
      final response = await cartsService.getUserCartsById(id: id.toString());
      if (response.resourceError != null) {
        throw response.resourceError!;
      }
      final cartsDto = response.body!;
      final result = cartsDto
          .map(
            (e) => CartEntity(
              id: e.id,
              userId: e.userId,
              date: e.date,
              products: e.products
                  .map(
                    (e) => CartProductEntity(
                      productId: e.productId,
                      quantity: e.quantity,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList();

      final carts = CartsListEntity(carts: result, quantity: result.length);

      return carts;
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }
}
