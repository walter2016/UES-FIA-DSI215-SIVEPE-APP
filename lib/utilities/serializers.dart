import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:com_app_tienda/Enrollment/model/enrollment_entity.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  CategoryEntity,
  ProductEntity,
  EnrollmentEntity,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));
