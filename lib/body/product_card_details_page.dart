import 'package:com_app_tienda/models/Product.dart';
import 'package:flutter/material.dart';

class DetalleProductos extends StatelessWidget {
  final Product product;

  const DetalleProductos({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.amber,
      appBar: buildAppBar(context),
      body: Text('hola'),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.backspace),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.card_giftcard),
          onPressed: () {},
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}
