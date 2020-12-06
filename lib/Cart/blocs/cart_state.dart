import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<CartLine> lines;
  CartState(this.lines);

  @override
  List<Object> get props => [lines];

  @override
  bool get stringify => true;

  num get total {
    num total = 0;
    for (CartLine line in lines) {
      total += line.quantity * line.product.precio;
    }
    return total;
  }

  bool isProductOnCart(int id) {
    for (CartLine line in lines) {
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

class CartLine extends Equatable {
  final ProductEntity product;
  final int quantity;
  CartLine({this.product, this.quantity});

  @override
  List<Object> get props => [product, quantity];

  @override
  bool get stringify => true;

  Map toJson() {
    return {
      'product': serializers.serializeWith(ProductEntity.serializer, product),
      'quantity': quantity
    };
  }
}
