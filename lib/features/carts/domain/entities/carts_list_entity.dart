import 'package:equatable/equatable.dart';
import 'package:test_task_application/features/carts/domain/entities/cart_entity.dart';

class CartsListEntity extends Equatable {
  final List<CartEntity> carts;
  final int quantity;

  const CartsListEntity({required this.carts, required this.quantity});

  @override
  List<Object?> get props => [carts, quantity];
}
