import 'package:com_app_tienda/Cart/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteListItemWidget extends StatefulWidget {
  String heroTag;
  Product product;
  VoidCallback onDismissed;

  FavoriteListItemWidget(
      {Key key, this.heroTag, this.product, this.onDismissed})
      : super(key: key);

  @override
  _FavoriteListItemWidgetState createState() => _FavoriteListItemWidgetState();
}

class _FavoriteListItemWidgetState extends State<FavoriteListItemWidget> {
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
                "The ${widget.product.name} product is removed from wish list")));
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
                  tag: widget.heroTag + widget.product.id,
                  child: Container(
                    height: 75,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(widget.product.image),
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
                              widget.product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Row(
                              children: <Widget>[
                                // The title of the product
                                Text(
                                  '${widget.product.sales} Sales',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),

                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                Text(
                                  widget.product.rate.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                      Text(widget.product.getPrice(),
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
