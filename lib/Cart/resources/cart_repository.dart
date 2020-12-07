import 'dart:convert';

import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  saveCart(CartState state) async {
    final list = state;
    final shared = await SharedPreferences.getInstance();
    final jsonList = jsonEncode(list);
    shared.setString("listCart", jsonList);
  }

  Future<CartState> getCart() async {
    List<CartLine> lines = <CartLine>[];
    final shared = await SharedPreferences.getInstance();
    final obtenerLista = shared.getString("listCart");
    final data = jsonDecode(obtenerLista ?? "[]");
    if (data != null) {
      for (var lineMap in data) {
        CartLine line = CartLine(
            product: serializers.deserializeWith(
                ProductEntity.serializer, lineMap["product"]),
            quantity: lineMap["quantity"]
        );
        lines.add(line);
      }
      return CartState(lines);
    }
    return CartState([]);
  }
}
