import 'package:com_app_tienda/Products/model/product_entity.dart';
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
    for(CartLine line in lines) {
      total += line.quantity * line.product.precio;
    }
    return total;
  }

  bool isProductOnCart(int id) {
    for(CartLine line in lines) {
      if (line.product.id == id) {
        return true;
      }
    }
    return false;
  }
}

class CartLine {
  ProductEntity product;
  int quantity;
  CartLine({ this.product, this.quantity });
}
