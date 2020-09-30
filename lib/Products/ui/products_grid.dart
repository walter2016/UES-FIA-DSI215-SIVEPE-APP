import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/body/product_card_details_page.dart';
import 'package:com_app_tienda/body/product_card_page.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final BuiltList<ProductEntity> products;

  ProductsGrid(this.products);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.60,
        ),
        itemBuilder: (context, index) => ListaProductos(
          product: products[index],
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleProductos(
                product: products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
