import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class AddProductToCart extends CartEvent {
  final ProductEntity product;
  AddProductToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final ProductEntity product;
  RemoveProductFromCart(this.product);

  @override
  List<Object> get props => [product];
}
