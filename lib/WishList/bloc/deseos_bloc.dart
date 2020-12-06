import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_event.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_state.dart';
import 'package:com_app_tienda/WishList/resources/deseos_repository.dart';

class DeseosBloc extends Bloc<DeseosEvent, DeseosState> {
  DeseosRepository _deseosRepository = DeseosRepository();

  DeseosBloc() : super(ListaDeseosLoading());

  @override
  Stream<DeseosState> mapEventToState(DeseosEvent event) async* {
    if (event is LoadListaDeseos) {
      yield* _mapLoadListaDeseosToState();
    } else if (event is AddProductToWishList) {
      yield* _mapAddProductToWishListToState(event);
    } else if (event is RemoveProductFromWishList) {
      yield* _mapRemoveProductFromCartState(event);
    }
  }

  Stream<DeseosState> _mapLoadListaDeseosToState() async* {
    yield ListaDeseosLoading();
    try {
      final deseos = await _deseosRepository.getListaDeDeseo();
      yield ListaDeseosLoaded(deseos);
    } catch (e) {
      print(e);
    }
  }

  Stream<DeseosState> _mapAddProductToWishListToState(
      AddProductToWishList event) async* {
    List<DeseoLine> lines = [...((state as ListaDeseosLoaded).lines)];
    if (!(state as ListaDeseosLoaded).isProductOnWishList(event?.product?.id)) {
      bool added =
          await _deseosRepository.addProductoToWishList(event?.product?.id);
      if (added) {
        lines.add(DeseoLine(product: event.product));
        yield ListaDeseosLoaded(lines);
      }
    } else {
      print('ya esta en la lista');
    }
  }

  Stream<DeseosState> _mapRemoveProductFromCartState(
      RemoveProductFromWishList event) async* {
    List<DeseoLine> lines = [...((state as ListaDeseosLoaded).lines)];
    int index = lines
          .lastIndexWhere((element) => element.product.id == event.product.id);
    bool removed =
        await _deseosRepository.deleteProductFromWishList(lines[index].id);
    if (removed) {
      int index = lines
          .lastIndexWhere((element) => element.product.id == event.product.id);
      lines.removeAt(index);
      yield ListaDeseosLoaded(lines);
    }
  }
}
