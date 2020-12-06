import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_event.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Cart/resources/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({CartState state}) : super(state);
  CartRepository cartRepository = new CartRepository();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProductToCart) {
      yield* _mapAddProductToCartToState(event);
    } else if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductFromCartState(event);
    }
  }

  Stream<CartState> _mapAddProductToCartToState(AddProductToCart event) async* {
    List<CartLine> lines = [...state.lines];
    if (!state.isProductOnCart(event?.product?.id)) {
      lines.add(CartLine(product: event.product, quantity: 1));
    } else {
      int index = lines
          .lastIndexWhere((element) => element.product.id == event.product.id);
      CartLine line = lines.elementAt(index);
      CartLine newLine =
          CartLine(product: line.product, quantity: line.quantity + 1);
      lines.insert(index, newLine);
      lines.removeAt(index + 1);
    }
    CartState newState = CartState(lines);
    cartRepository.saveCart(newState);
    yield newState;
  }

  Stream<CartState> _mapRemoveProductFromCartState(
      RemoveProductFromCart event) async* {
    List<CartLine> lines = [...state.lines];
    int index = lines
        .lastIndexWhere((element) => element.product.id == event.product.id);
    CartLine line = lines.elementAt(index);
    if (line.quantity > 1) {
      int index = lines
          .lastIndexWhere((element) => element.product.id == event.product.id);
      CartLine line = lines.elementAt(index);
      CartLine newLine =
          CartLine(product: line.product, quantity: line.quantity - 1);
      lines.insert(index, newLine);
      lines.removeAt(index + 1);
    } else if (line.quantity == 1) {
      lines.removeAt(index);
    }
    CartState newState = CartState(lines);
    cartRepository.saveCart(newState);
    yield newState;
  }
}
