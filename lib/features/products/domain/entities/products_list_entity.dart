import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';

class ProductsListEntity extends Equatable {
  const ProductsListEntity({required this.users, required this.totalCount});

  ProductsListEntity copyWith({List<ProductEntity>? users, int? totalCount}) =>
      ProductsListEntity(
        totalCount: totalCount ?? this.totalCount,
        users: users ?? this.users,
      );

  final List<ProductEntity> users;
  final int totalCount;

  @override
  List<Object?> get props => [users, totalCount];
}
