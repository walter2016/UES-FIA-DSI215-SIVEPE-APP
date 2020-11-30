import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/body/product_card_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/deseos_bloc.dart';
import 'bloc/deseos_state.dart';

class ProductGridItemWidget extends StatefulWidget {
  final DeseoLine deseoLine;
  const ProductGridItemWidget({
    Key key,
    this.deseoLine,
    @required this.heroTag,
  }) : super(key: key);

  final String heroTag;

  @override
  _ProductGridItemWidgetState createState() => _ProductGridItemWidgetState();
}

class _ProductGridItemWidgetState extends State<ProductGridItemWidget> {
  DeseosBloc _deseosBloc;

  @override
  void initState() {
    super.initState();
    _deseosBloc = BlocProvider.of<DeseosBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
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
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                  tag: this.widget.heroTag +
                      widget.deseoLine.product.id.toString(),
                  child: Image.network(widget.deseoLine.product.imagenUrl ??
                      'https://via.placeholder.com/350x350.png')),
              SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  widget.deseoLine.product.nombre,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '\$${widget.deseoLine.product.precio.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    // The title of the product
                    Expanded(
                      child: Text(
                        '345 Sales',
                        style: Theme.of(context).textTheme.body1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                    Text(
                      '3.5',
                      style: Theme.of(context).textTheme.body2,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
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
