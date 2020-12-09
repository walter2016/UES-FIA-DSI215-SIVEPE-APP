import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Ordenes/model/order_entity.dart';
import 'package:equatable/equatable.dart';

class OrderState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class OrdersLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final BuiltList<OrderEntity> orders;
  OrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}
