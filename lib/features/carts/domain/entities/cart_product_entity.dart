import 'package:equatable/equatable.dart';

class CartProductEntity extends Equatable {
  final int productId;
  final int quantity;

  const CartProductEntity({required this.productId, required this.quantity});

  @override
  List<Object?> get props => [productId, quantity];
}
