import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadCategories extends CategoryEvent {}

class LoadCategoriesSuccess extends CategoryEvent {
  final BuiltList<CategoryEntity> categories;
  LoadCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
