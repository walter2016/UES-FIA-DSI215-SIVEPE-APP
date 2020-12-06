import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_state.dart';
import 'package:com_app_tienda/utilities/constants.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeseosRepository {
  Dio _dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  Future<List<DeseoLine>> getListaDeDeseo() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await _dio.get('deseos', options: options);
    List<DeseoLine> listaDeseos = <DeseoLine>[];
    for(var deseoMap in response.data){
      ProductEntity product = serializers.deserializeWith(ProductEntity.serializer, deseoMap["producto"]);
      DeseoLine deseoLine = DeseoLine(id: deseoMap["id"],product: product);
      listaDeseos.add(deseoLine);
    }
    return listaDeseos;
  }

  Future<bool> addProductoToWishList(int productId) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await _dio.post('deseos', data: {
      "productoId": productId
    }, options: options);
    return response?.data["id"] is num;
  }

  Future<bool> deleteProductFromWishList(int wishId) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await _dio.delete('deseos/$wishId', options: options);
    return response?.data["id"] is num;
  }
}
