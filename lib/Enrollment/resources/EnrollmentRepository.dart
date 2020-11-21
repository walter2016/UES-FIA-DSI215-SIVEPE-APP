import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Enrollment/model/enrollment_entity.dart';
import 'package:com_app_tienda/utilities/constants.dart';
import 'package:com_app_tienda/utilities/serializers.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnrollmentRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  Future<dynamic> createEnrollmentRequest(EnrollmentEntity enrollmentEntity) async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {
      'Authorization': 'Bearer $token'
    });
    final response = await dio.post(
      'SolicitudDeAfiliacion',
      data: serializers.serializeWith(EnrollmentEntity.serializer, enrollmentEntity),
      options: options
    );
    return response.data;
  }

  Future<EnrollmentEntity> getEnrollmentRequest() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    Options options = new Options(headers: {
      'Authorization': 'Bearer $token'
    });
    final response = await dio.get('SolicitudDeAfiliacion', options: options);
    return serializers.deserializeWith(EnrollmentEntity.serializer, response.data[0]);
  }
}
