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
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: product.id.toString(),
                child: Container(
                  width: (size.width - 16) / 2,
                  height: (size.width - 16) / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.imagenUrl != null
                              ? product.imagenUrl
                              : 'https://d2f7anuvnar8n5.cloudfront.net/external_assets/tutorials/artwork_logos_v1/soldier.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  product.nombre,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "\$" + product.precio.toString() + " USD",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
