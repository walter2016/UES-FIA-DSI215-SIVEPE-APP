import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import '../../utilities/constants.dart';
import '../model/category_entity.dart';

class CategoryRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));

  Future<BuiltList<CategoryEntity>> getCategories() async {
    final response = await dio.get('categories');
    final categories = deserializeListOf<CategoryEntity>(response.data);
    return categories;
  }
}
