import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';

class ProductsListEntity extends Equatable {
  const ProductsListEntity({required this.products, required this.totalCount});

  ProductsListEntity copyWith({List<ProductEntity>? products, int? totalCount}) =>
      ProductsListEntity(
        totalCount: totalCount ?? this.totalCount,
        products: products ?? this.products,
      );

  final List<ProductEntity> products;
  final int totalCount;

  @override
  List<Object?> get props => [products, totalCount];
}
