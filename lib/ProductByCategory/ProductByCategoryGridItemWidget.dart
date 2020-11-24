import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:flutter/material.dart';

class ProductByCategoryGridItemWidget extends StatelessWidget {
  const ProductByCategoryGridItemWidget({
    Key key,
    @required this.product,
    @required this.heroTag,
    @required this.onTap
  }) : super(key: key);

  final ProductEntity product;
  final String heroTag;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: onTap,
      child: Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: this.heroTag + product.id.toString(),
                child: Image.network(product.imagenUrl ?? 'https://via.placeholder.com/350x350'),
              ),
              SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  product.nombre,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '\$${product.precio.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
