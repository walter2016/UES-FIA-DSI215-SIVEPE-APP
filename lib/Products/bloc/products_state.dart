import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final BuiltList<ProductEntity> products;
  ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsLoadFailure extends ProductsState {}
