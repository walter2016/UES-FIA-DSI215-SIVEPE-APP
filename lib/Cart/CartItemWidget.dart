import 'package:com_app_tienda/Cart/blocs/cart_bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cart_state.dart';

class CartItemWidget extends StatefulWidget {
  final String heroTag;
  final CartLine cartLine;
  final int quantity;

  CartItemWidget({Key key, this.cartLine, this.heroTag, this.quantity = 1})
      : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

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
                tag: widget.heroTag + widget.cartLine.product.id.toString(),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(widget.cartLine.product.imagenUrl ?? 'https://via.placeholder.com/350x350.png'),
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
                            widget.cartLine.product.nombre,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          Text(
                            '\$${widget.cartLine.product.precio.toStringAsFixed(2)}',
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
                        IconButton(
                          onPressed: incrementQuantity,
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          icon: Icon(Icons.add_circle_outline),
                          color: Theme.of(context).hintColor,
                        ),
                        Text(widget.cartLine.quantity.toString(),
                            style: Theme.of(context).textTheme.subhead),
                        IconButton(
                          onPressed: decrementQuantity,
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          icon: Icon(Icons.remove_circle_outline),
                          color: Theme.of(context).hintColor,
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

  incrementQuantity() {
    _cartBloc.add(AddProductToCart(widget.cartLine.product));
  }

  decrementQuantity() {
    _cartBloc.add(RemoveProductFromCart(widget.cartLine.product));
  }
}
