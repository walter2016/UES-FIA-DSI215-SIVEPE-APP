import 'package:com_app_tienda/Cart/product.dart';
import 'package:flutter/material.dart';

class PagoItemWidget extends StatefulWidget {
  String heroTag;
  Product product;
  int quantity;

  PagoItemWidget({Key key, this.product, this.heroTag, this.quantity = 1})
      : super(key: key);

  @override
  _PagoItemWidgetState createState() => _PagoItemWidgetState();
}

class _PagoItemWidgetState extends State<PagoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.heroTag + widget.product.id,
                child: Container(
                  height: 90,
                  width: 90,
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
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          Text(
                            widget.product.getPrice(),
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Chip(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: Colors.transparent,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context).focusColor)),
                          label: Text(
                            'x ${widget.quantity.toString()}',
                            style:
                                TextStyle(color: Theme.of(context).focusColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  incrementQuantity(int quantity) {
    if (quantity <= 99) {
      return ++quantity;
    } else {
      return quantity;
    }
  }

  decrementQuantity(int quantity) {
    if (quantity > 1) {
      return --quantity;
    } else {
      return quantity;
    }
  }
}
