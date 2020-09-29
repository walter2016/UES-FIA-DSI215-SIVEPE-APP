import 'package:com_app_tienda/Categories/bloc/categories_bloc.dart';
import 'package:com_app_tienda/Categories/bloc/categories_event.dart';
import 'package:com_app_tienda/Categories/bloc/categories_state.dart';
import 'package:com_app_tienda/Categories/ui/categories_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatefulWidget {
  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  CategoriesBloc categoriesBloc;

  @override
  void initState() {
    super.initState();
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (BuildContext context, CategoriesState state) {

        if (state is CategoriesLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoriesLoaded) {
          return CategoryGrid(state.categories);
        }

        if (state is CategoriesLoadFailure) {
          return Center(
            child: Container(child: Text('No se pudo cargar las categorias.'),),
          );
        }

        return Container();
      },
    );
  }
}
