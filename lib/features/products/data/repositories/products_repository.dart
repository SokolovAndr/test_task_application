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
  
  final ProductsService productsService;

  Future<ProductsListEntity> getProducts() async {
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
                (rating) =>
                    RatingEntity(rate: rating.rate, count: rating.count),
              ),
            ),
          )
          .toList();
      return ProductsListEntity(
        products: products,
        totalCount: products.length,
      );
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }

  Future<ProductEntity> getProductById({required int id}) async {
    try {
      final response = await productsService.getProductById(id: id.toString());
      if (response.resourceError != null) {
        throw response.resourceError!;
      }
      final productDto = response.body!;

      return ProductEntity(
        id: productDto.id,
        title: productDto.title,
        price: productDto.price,
        description: productDto.description,
        category: productDto.category,
        image: productDto.image,
        rating: RatingEntity(
          rate: productDto.rating.rate,
          count: productDto.rating.count,
        ),
      );
    } on ResourceError catch (_) {
      rethrow;
    } catch (_, stack) {
      Error.throwWithStackTrace(RequestError(S.current.unknown_error), stack);
    }
  }
}
