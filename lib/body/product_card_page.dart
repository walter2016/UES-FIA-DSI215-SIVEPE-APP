import 'package:com_app_tienda/models/Product.dart';
import 'package:flutter/material.dart';

class ListaProductos extends StatelessWidget {
  final Product product;
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
                child: Image.asset(product.imagenUrl),
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
                image: NetworkImage(
                    'https://img.favpng.com/0/15/21/sales-logo-discounts-and-allowances-best-practice-png-favpng-ACrL1DqDEv4LYt8DszQ09fmHz.jpg'),
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
