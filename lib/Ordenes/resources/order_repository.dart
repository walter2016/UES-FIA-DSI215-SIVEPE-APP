import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Ordenes/model/order_entity.dart';
import 'package:com_app_tienda/utilities/constants.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepository {
  Dio _dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  Future<BuiltList<OrderEntity>> getOrders() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await _dio.get('ordenes', options: options);
    BuiltList<OrderEntity> ordenes =
        deserializeListOf<OrderEntity>(response.data);
    return ordenes;
  }

  Future<OrderEntity> createOrder(OrderEntity order) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {'Authorization': 'Bearer $token'});
    final Response response = await _dio.post('ordenes',
        data: serializers.serializeWith(OrderEntity.serializer, order),
        options: options);
    final orderCreated = serializers.deserializeWith(OrderEntity.serializer, response.data);
    return orderCreated;
  }
}
