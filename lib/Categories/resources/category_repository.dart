import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/constants.dart';
import '../model/category_entity.dart';

class CategoryRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));

  Future<BuiltList<CategoryEntity>> getCategories() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {
      'Authorization': 'Bearer $token'
    });
    final response = await dio.get('categorias', options: options);
    return deserializeListOf<CategoryEntity>(response.data);
  }
}
