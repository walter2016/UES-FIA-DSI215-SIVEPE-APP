import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadProducts extends ProductsEvent {}

class LoadProductsByCategory extends ProductsEvent {
  final int categoryId;

  LoadProductsByCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class LoadProductsSuccess extends ProductsEvent {
  final BuiltList<ProductEntity> products;

  LoadProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}
