import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';

class DeseosEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class AddProductToWishList extends DeseosEvent {
  final ProductEntity product;
  AddProductToWishList(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishList extends DeseosEvent {
  final ProductEntity product;
  RemoveProductFromWishList(this.product);

  @override
  List<Object> get props => [product];
}

class LoadListaDeseos extends DeseosEvent {}
