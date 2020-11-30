import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_event.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_state.dart';
import 'package:flutter/cupertino.dart';

class DeseosBloc extends Bloc<DeseosEvent, DeseosState> {
  DeseosBloc() : super(DeseosState([]));

  @override
  Stream<DeseosState> mapEventToState(DeseosEvent event) async* {
    if (event is AddProductToWishList) {
      yield* _mapAddProductToWishListToState(event);
    } else if (event is RemoveProductFromWishList) {
      yield* _mapRemoveProductFromCartState(event);
    }
  }

  Stream<DeseosState> _mapAddProductToWishListToState(
      AddProductToWishList event) async* {
    List<DeseoLine> lines = [...state.lines];
    if (!state.isProductOnWishList(event?.product?.id)) {
      lines.add(DeseoLine(product: event.product));
    } else {
      print('ya esta en la lista');
    }
    yield DeseosState(lines);
  }

  Stream<DeseosState> _mapRemoveProductFromCartState(
      RemoveProductFromWishList event) async* {
    List<DeseoLine> lines = [...state.lines];
    int index = lines
        .lastIndexWhere((element) => element.product.id == event.product.id);
    lines.removeAt(index);
    yield DeseosState(lines);
  }
}
