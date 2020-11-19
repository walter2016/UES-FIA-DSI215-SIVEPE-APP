import 'package:bloc/bloc.dart';
import 'package:com_app_tienda/Categories/bloc/categories_event.dart';
import 'package:com_app_tienda/Categories/bloc/categories_state.dart';
import 'package:com_app_tienda/Categories/resources/category_repository.dart';
import 'package:dio/dio.dart';

class CategoriesBloc extends Bloc<CategoryEvent, CategoriesState> {
  final CategoryRepository categoryRepository;
  CategoriesBloc({ this.categoryRepository }) : super(CategoriesLoadInProgress());

  @override
  Stream<CategoriesState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState(event);
    } else if (event is LoadCategoriesSuccess) {
      yield* _mapCategoriesLoadSuccessToState(event);
    }
  }

  Stream<CategoriesState> _mapLoadCategoriesToState(LoadCategories event) async* {
    try {
      final categories = await categoryRepository.getCategories();
      add(LoadCategoriesSuccess(categories));
    } on DioError catch(e) {
      print(e);
      yield CategoriesLoadFailure();
    }
  }

  Stream<CategoriesState> _mapCategoriesLoadSuccessToState(LoadCategoriesSuccess event) async* {
    yield CategoriesLoaded(event.categories);
  }
  
}
