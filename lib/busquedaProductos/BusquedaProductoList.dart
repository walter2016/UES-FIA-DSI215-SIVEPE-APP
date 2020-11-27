import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BusquedaProductoListItemWidget extends StatefulWidget {
  String heroTag;
  ProductEntity product;
  VoidCallback onDismissed;
  final Function onTap;

  BusquedaProductoListItemWidget(
      {Key key, this.heroTag, this.product, this.onDismissed, this.onTap})
      : super(key: key);

  @override
  _BusquedaProductoListItemWidgetState createState() =>
      _BusquedaProductoListItemWidgetState();
}

class _BusquedaProductoListItemWidgetState
    extends State<BusquedaProductoListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Hero(
                tag: widget.heroTag + widget.product.id.toString(),
                child: Container(
                  height: 75,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(widget.product.imagenUrl ??
                            'https://via.placeholder.com/350x350.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.product.nombre,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Text('\$${widget.product.precio.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(width: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
