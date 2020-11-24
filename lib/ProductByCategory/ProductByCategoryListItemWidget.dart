import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryListItemWidget extends StatefulWidget {
  String heroTag;
  ProductEntity product;
  VoidCallback onDismissed;

  CategoryListItemWidget(
      {Key key, this.heroTag, this.product, this.onDismissed})
      : super(key: key);

  @override
  _CategoryListItemWidgetState createState() => _CategoryListItemWidgetState();
}

class _CategoryListItemWidgetState extends State<CategoryListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.product.hashCode.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          widget.onDismissed();
        });

        // Then show a snackbar.
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
                "The ${widget.product.nombre} product is removed from wish list")));
      },
      child: InkWell(
        onTap: () {},
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
                          image: NetworkImage(widget.product.imagenUrl ?? 'https://via.placeholder.com/350x350.png'),
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
      ),
    );
  }
}
