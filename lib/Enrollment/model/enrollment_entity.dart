import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enrollment_entity.g.dart';

abstract class EnrollmentEntity implements Built<EnrollmentEntity, EnrollmentEntityBuilder> {
  factory EnrollmentEntity([void updates(EnrollmentEntityBuilder b)]) = _$EnrollmentEntity;

  EnrollmentEntity._();

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'PagareUrl')
  String get pagareUrl;

  @nullable
  @BuiltValueField(wireName: 'ReciboAguaUrl')
  String get waterBillUrl;

  @nullable
  @BuiltValueField(wireName: 'ReciboLuzUrl')
  String get energyBillUrl;

  @nullable
  @BuiltValueField(wireName: 'ReciboTelefonoUrl')
  String get phoneBillUrl;

  @nullable
  @BuiltValueField(wireName: 'ReferenciaBancariaUrl')
  String get bankReferenceUrl;

  static Serializer<EnrollmentEntity> get serializer => _$enrollmentEntitySerializer;
}
