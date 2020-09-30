import 'package:com_app_tienda/Products/bloc/products_bloc.dart';
import 'package:com_app_tienda/Products/bloc/products_event.dart';
import 'package:com_app_tienda/Products/bloc/products_state.dart';
import 'package:com_app_tienda/Products/ui/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTabs extends StatefulWidget {
  @override
  _ProductsTabsState createState() => _ProductsTabsState();
}

class _ProductsTabsState extends State<ProductsTabs> {
  ProductsBloc productsBloc;

  @override
  void initState() {
    super.initState();
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add( LoadProducts() );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (BuildContext context, ProductsState state) {
        if (state is ProductsLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsLoaded) {
          return ProductsGrid(state.products);
        }
        if (state is ProductsLoadFailure) {
          return Center(
            child: Text('No se pudo cargar los productos'),
          );
        }
        return Container();
      },
    );
  }
}
