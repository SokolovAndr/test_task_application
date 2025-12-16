import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/features/products/data/data_sources/remote/products_service.dart';
import 'package:test_task_application/features/products/data/dto/rating_dto.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';
import 'package:test_task_application/features/products/domain/entities/products_list_entity.dart';
import 'package:test_task_application/features/products/domain/entities/rating_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProductsRepository {
  ProductsRepository(this.productsService);

  static const int limit = 10; //TODO или 50?

  final ProductsService productsService;

  Future<ProductsListEntity> getUsers({int page = 0}) async {
    try {
      final response = await productsService.getProducts();
      if (response.resourceError != null) {
        throw response.resourceError!;
      }
      final body = response.body!;

      final products = body
          .map(
            (product) => ProductEntity(
              id: product.id,
              title: product.title,
              price: product.price,
              description: product.description,
              category: product.category,
              image: product.image,
              rating: product.rating.map(
                (rating) => RatingEntity(rate: rating.rate, count: rating.count),
              ),
            ),
          )
          .toList();
      return ProductsListEntity(users: products, totalCount: products.length);
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }
}
