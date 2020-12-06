import 'dart:convert';

import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  saveCart(CartState state) async {
    final list = state;
    final shared = await SharedPreferences.getInstance();
    final jsonList = jsonEncode(list);
    shared.setString("listCart", jsonList);
  }

  Future<CartState> getCart() async {
    final shared = await SharedPreferences.getInstance();
    final obtenerLista = shared.getString("listCart");
    final data = jsonDecode(obtenerLista);
    print('data');
    print(data);
  }
}
