import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_line_entity.g.dart';

abstract class OrderLineEntity implements Built<OrderLineEntity, OrderLineEntityBuilder> {
  factory OrderLineEntity([void updates(OrderLineEntityBuilder b)]) = _$OrderLineEntity;

  OrderLineEntity._();

  @nullable
  int get id;

  @nullable
  int get productoId;

  @nullable
  double get precioUnitario;

  @nullable
  int get cantidad;

  static Serializer<OrderLineEntity> get serializer => _$orderLineEntitySerializer;
}