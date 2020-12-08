import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/Products/bloc/products_event.dart';
import 'package:com_app_tienda/Products/bloc/products_state.dart';
import 'package:com_app_tienda/Products/resources/products_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({this.productsRepository}) : super(ProductsLoadInProgress());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState();
    } else if (event is LoadProductsByCategory) {
      yield* _mapLoadProductsByCategoryToState(event);
    } else if (event is LoadProductsSuccess) {
      yield* _mapLoadProductsSuccess(event);
    }
  }

  Stream<ProductsState> _mapLoadProductsToState() async* {
    yield ProductsLoadInProgress();
    try {
      final products = await productsRepository.getProducts();
      add(LoadProductsSuccess(products));
    } catch (e) {
      print(e.toString());
      yield ProductsLoadFailure();
    }
  }

  Stream<ProductsState> _mapLoadProductsByCategoryToState(
      LoadProductsByCategory event) async* {
    yield ProductsLoadInProgress();
    try {
      final products =
          await productsRepository.getProductsByCategory(event?.categoryId);
      add(LoadProductsSuccess(products));
    } catch (e) {
      print(e.toString());
      yield ProductsLoadFailure();
    }
  }

  Stream<ProductsState> _mapLoadProductsSuccess(
      LoadProductsSuccess event) async* {
    yield ProductsLoaded(event.products);
  }
}
