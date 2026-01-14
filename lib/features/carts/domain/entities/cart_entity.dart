import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_product_entity.dart';

class CartEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductEntity> products;

  const CartEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  @override
  List<Object?> get props => [id, userId, date, products];
}

extension CartEntityProductsCount on CartEntity {
  String get count => products
      .map((e) => e.quantity)
      .fold(0, (sum, quantity) => sum + quantity)
      .toString();
}
