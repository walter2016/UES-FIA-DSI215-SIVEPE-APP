import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_entity.g.dart';

abstract class ProductEntity implements Built<ProductEntity, ProductEntityBuilder> {

  factory ProductEntity([void updates(ProductEntityBuilder b)]) = _$ProductEntity;

  ProductEntity._();

  @nullable
  int get id;

  @nullable
  String get nombre;

  @nullable
  double get precio;

  @nullable
  String get imagenUrl;

  @nullable
  int get idCategoria;

  @nullable
  int get idPerfil;

  static Serializer<ProductEntity> get serializer => _$productEntitySerializer;
}
