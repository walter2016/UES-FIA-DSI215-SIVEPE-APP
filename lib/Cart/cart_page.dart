import 'package:com_app_tienda/Cart/CartItemWidget.dart';
import 'package:com_app_tienda/Cart/blocs/cart_bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Pago/RealizarPago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatefulWidget {
  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
            cubit: _cartBloc,
            builder: (BuildContext context, CartState state) {
              return Container(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                                leading: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.grey[800],
                                ),
                                title: Text(
                                  'Carrito de Compras',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                  'Verifique su cantidad y haga clic en pagar',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: state.lines.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 1);
                              },
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                    cartLine: state.lines.elementAt(index),
                                    heroTag: 'cart');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 1.0, left: 4.0, right: 4.0),
                      height: 120,
                      child: Card(
                        elevation: 3.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Subtotal"),
                                  Text("\$${state.total.toStringAsFixed(2)}"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Costo de Envío"),
                                  Text(
                                    "\$2.00",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Total",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("\$${(state.total + 2).toStringAsFixed(2)}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        color: Color(0xFFff9100),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return RealizarPago();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Realizar Pago",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            }));
  }
}
