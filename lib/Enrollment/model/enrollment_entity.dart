import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enrollment_entity.g.dart';

abstract class EnrollmentEntity implements Built<EnrollmentEntity, EnrollmentEntityBuilder> {
  factory EnrollmentEntity([void updates(EnrollmentEntityBuilder b)]) = _$EnrollmentEntity;

  EnrollmentEntity._();

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'pagareUrl')
  String get pagareUrl;

  @nullable
  @BuiltValueField(wireName: 'reciboAguaUrl')
  String get waterBillUrl;

  @nullable
  @BuiltValueField(wireName: 'reciboLuzUrl')
  String get energyBillUrl;

  @nullable
  @BuiltValueField(wireName: 'reciboTelefonoUrl')
  String get phoneBillUrl;

  @nullable
  @BuiltValueField(wireName: 'referenciaBancariaUrl')
  String get bankReferenceUrl;

  @nullable
  @BuiltValueField(wireName: 'estado')
  bool get status;

  @nullable
  @BuiltValueField(wireName: 'fecha')
  String get date;

  @nullable
  @BuiltValueField(wireName: 'comentario')
  String get comment;

  static Serializer<EnrollmentEntity> get serializer => _$enrollmentEntitySerializer;
}
