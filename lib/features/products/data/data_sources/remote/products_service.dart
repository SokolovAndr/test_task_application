import 'package:chopper/chopper.dart';
import 'package:test_task_application/features/products/data/dto/product_dto.dart';

part 'products_service.chopper.dart';

@ChopperApi()
abstract class ProductsService extends ChopperService {
  static ProductsService create([ChopperClient? client]) =>
      _$ProductsService(client);

  @GET(path: 'products')
  Future<Response<List<ProductDto>>> getProducts();

  @GET(path: 'products/{id}')
  Future<Response<ProductDto>> getProductById({@Path() required String id});
}
