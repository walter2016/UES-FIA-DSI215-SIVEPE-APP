import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class CategoriesLoadInProgress extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final BuiltList<CategoryEntity> categories;
  CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesLoadFailure extends CategoriesState {}
