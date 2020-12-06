import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/utilities/constants.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  Future<BuiltList<ProductEntity>> getProducts() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await dio.get('productos', options: options);
    return deserializeListOf<ProductEntity>(response.data);
  }

  Future<BuiltList<ProductEntity>> getProductsByCategory(int categoryId) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response =
        await dio.get('Productos?categoria=$categoryId', options: options);
    return deserializeListOf<ProductEntity>(response.data);
  }

  Future<BuiltList<ProductEntity>> getProductsByCategoryId(
      int categoryId) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response =
        await dio.get('productos?categoria=$categoryId', options: options);
    print(deserializeListOf<ProductEntity>(response.data));
    return deserializeListOf<ProductEntity>(response.data);
  }
}
