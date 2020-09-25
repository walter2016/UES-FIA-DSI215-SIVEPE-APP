import 'package:com_app_tienda/models/Category.dart';
import 'package:com_app_tienda/models/Product.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> getCategorias() async {
  final resp = await http.get('http://192.168.0.15:8081/category');

  return categoryFromJson(resp.body);
}

Future<List<Product>> getProductos() async {
  final resp = await http.get('http://192.168.0.15:8081/products');

  return productFromJson(resp.body);
}
