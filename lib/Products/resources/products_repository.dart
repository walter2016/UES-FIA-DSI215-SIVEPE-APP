import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/utilities/constants.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';

class ProductsRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  Future<BuiltList<ProductEntity>> getProducts() async {
    final Response response = await dio.get('productos');
    return deserializeListOf<ProductEntity>(response.data);
  }
}