import 'package:com_app_tienda/Products/bloc/products_bloc.dart';
import 'package:com_app_tienda/Products/bloc/products_event.dart';
import 'package:com_app_tienda/Products/bloc/products_state.dart';
import 'package:com_app_tienda/Products/ui/products_grid.dart';
import 'package:com_app_tienda/busquedaProductos/busquedaProductos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusquedaProductos extends StatefulWidget {
  @override
  _BusquedaProductosState createState() => _BusquedaProductosState();
}

class _BusquedaProductosState extends State<BusquedaProductos> {
  ProductsBloc productsBloc;

  @override
  void initState() {
    super.initState();
    productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xFFFF9800),
        title: const Text('Buscar Producto'),
      ),
      body: Wrap(
        children: <Widget>[
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (BuildContext context, ProductsState state) {
              if (state is ProductsLoadInProgress) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductsLoaded) {
                return BusquedaProductosFinal(state.products);
              }
              if (state is ProductsLoadFailure) {
                return Center(
                  child: Text('No se pudo cargar los productos'),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
