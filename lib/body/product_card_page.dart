import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:flutter/material.dart';

class ListaProductos extends StatelessWidget {
  final ProductEntity product;
  final Function press;
  const ListaProductos({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: Colors.amber,
                child: Image.network(product.imagenUrl != null ? product.imagenUrl : 'https://via.placeholder.com/350x350'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              // products is out demo list
              product.nombre,
              style: TextStyle(color: Color(0xFFACACAC)),
            ),
          ),
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(
                    'assets/images/sale.jpg'),
                height: 50,
                width: 50,
              ),
              Text(
                product.precio.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
