import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/Ordenes/bloc/order_event.dart';
import 'package:com_app_tienda/Ordenes/bloc/order_state.dart';
import 'package:com_app_tienda/Ordenes/resources/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository _orderRepository;

  OrderBloc(OrderRepository repository) : super(OrdersLoading()) {
    _orderRepository = repository;
  }

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is CreateOrder) {
      yield* _mapCreateOrderToState(event);
    } else if (event is LoadOrders) {
      yield* _mapLoadOrdersToState(event);
    } else if (event is LoadOrdersSuccess) {
      yield* _mapLoadOrdersSuccessToState(event);
    }
  }

  Stream<OrderState> _mapCreateOrderToState(CreateOrder event) async* {
    final order = await _orderRepository.createOrder(event.order);
    print(order);
  }

  Stream<OrderState> _mapLoadOrdersToState(LoadOrders event) async* {
    yield OrdersLoading();
    try {
      final orders = await _orderRepository.getOrders();
      add(LoadOrdersSuccess(orders));
    } catch(e) {
      print(e);
    }
  }

  Stream<OrderState> _mapLoadOrdersSuccessToState(LoadOrdersSuccess event) async* {
    yield OrdersLoaded(event.orders);
  }
  
}
