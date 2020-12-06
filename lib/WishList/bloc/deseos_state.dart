import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:com_app_tienda/utilities/serializers.dart';

class DeseosState extends Equatable {
  
  DeseosState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ListaDeseosLoaded extends DeseosState {
  final List<DeseoLine> lines;
  ListaDeseosLoaded(this.lines);

  @override
  List<Object> get props => [lines];

  bool isProductOnWishList(int id) {
    for (DeseoLine line in lines) {
      if (line.product.id == id) {
        return true;
      }
    }
    return false;
  }

  List toJson() {
    return lines.map((element) => element.toJson()).toList();
  }
}

class ListaDeseosLoading extends DeseosState {}

class ListaDeseosError extends DeseosState {
  final String message;

  ListaDeseosError({ this.message });

  @override
  List<Object> get props => [message];
}

class DeseoLine extends Equatable {
  final int id;
  final ProductEntity product;

  DeseoLine({
    this.id,
    this.product,
  });

  @override
  List<Object> get props => [product];

  @override
  bool get stringify => true;

  Map toJson() {
    return {
      'product': serializers.serializeWith(ProductEntity.serializer, product),
    };
  }
}
