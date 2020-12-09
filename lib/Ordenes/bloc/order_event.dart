import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Ordenes/model/order_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadOrders extends OrderEvent {}

class LoadOrdersSuccess extends OrderEvent {
  final BuiltList<OrderEntity> orders;
  LoadOrdersSuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

class CreateOrder extends OrderEvent {
  final OrderEntity order;
  CreateOrder(this.order);

  @override
  List<Object> get props => [order];
}
