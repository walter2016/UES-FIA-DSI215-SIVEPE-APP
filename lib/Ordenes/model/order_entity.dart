import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:com_app_tienda/Ordenes/model/order_line_entity.dart';

part 'order_entity.g.dart';

abstract class OrderEntity implements Built<OrderEntity, OrderEntityBuilder> {
  factory OrderEntity([void updates(OrderEntityBuilder b)]) = _$OrderEntity;

  OrderEntity._();

  @nullable
  int get id;

  @nullable
  String get estado;

  @nullable
  String get fecha;

  @nullable
  String get usuarioId;

  @nullable
  BuiltList<OrderLineEntity> get lineaDeOrden;

  static Serializer<OrderEntity> get serializer => _$orderEntitySerializer;
}
