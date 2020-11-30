import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:com_app_tienda/utilities/serializers.dart';

class DeseosState extends Equatable {
  final List<DeseoLine> lines;
  DeseosState(this.lines);

  @override
  List<Object> get props => [lines];

  @override
  bool get stringify => true;

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

class DeseoLine extends Equatable {
  final ProductEntity product;

  DeseoLine({
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
