import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_bloc.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_event.dart';
import 'package:com_app_tienda/body/product_card_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/deseos_state.dart';

// ignore: must_be_immutable
class FavoriteListItemWidget extends StatefulWidget {
  String heroTag;

  final DeseoLine deseoLine;
  VoidCallback onDismissed;

  FavoriteListItemWidget(
      {Key key, this.heroTag, this.deseoLine, this.onDismissed})
      : super(key: key);

  @override
  _FavoriteListItemWidgetState createState() => _FavoriteListItemWidgetState();
}

class _FavoriteListItemWidgetState extends State<FavoriteListItemWidget> {
  DeseosBloc _deseosBloc;

  @override
  void initState() {
    super.initState();
    _deseosBloc = BlocProvider.of<DeseosBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        final snackBar = SnackBar(
          content: Text(
              'El producto ${widget.deseoLine.product.nombre} se elimina de la lista de deseos'),
          action: SnackBarAction(
            label: 'Eliminar',
            onPressed: () {
              _deleteWishList();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              product: widget.deseoLine.product,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Hero(
                tag: widget.heroTag + widget.deseoLine.product.id.toString(),
                child: Container(
                  height: 75,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.deseoLine.product.imagenUrl ??
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
                            widget.deseoLine.product.nombre,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Row(
                            children: <Widget>[
                              // The title of the product
                              Text(
                                '345 Sales',
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
                                '3.4',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                    Text(
                        '\$${widget.deseoLine.product.precio.toStringAsFixed(2)}',
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

  _deleteWishList() {
    _deseosBloc.add(RemoveProductFromWishList(widget.deseoLine.product));
    print('Eliminar');
  }
}
