import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_entity.g.dart';

abstract class CategoryEntity implements Built<CategoryEntity, CategoryEntityBuilder> {
  
  factory CategoryEntity([void updates(CategoryEntityBuilder b)]) = _$CategoryEntity;

  CategoryEntity._();

  @nullable
  int get id;

  @nullable
  String get nombre;

  @nullable
  int get idPadre;

  static Serializer<CategoryEntity> get serializer => _$categoryEntitySerializer;
}
