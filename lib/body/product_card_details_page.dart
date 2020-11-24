import 'package:com_app_tienda/Cart/blocs/cart_bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_event.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/Rating/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatefulWidget {
  final ProductEntity product;

  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  CartBloc _cartBloc;
  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.product.nombre,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        brightness: Brightness.light,
        backgroundColor: Color(0xFFff9100),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: Color(0xFFFFFFFF),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        cubit: _cartBloc,
        builder: (BuildContext context, CartState state){
          int count;
          if (state.isProductOnCart(widget.product.id)) {
            int index = state.lines.indexWhere((element) => element.product.id == widget.product.id);
            count = state.lines.elementAt(index).quantity;

          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.product.imagenUrl != null
                          ? widget.product.imagenUrl
                          : 'https://d2f7anuvnar8n5.cloudfront.net/external_assets/tutorials/artwork_logos_v1/soldier.png',
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.product.imagenUrl != null
                                ? widget.product.imagenUrl
                                : 'https://d2f7anuvnar8n5.cloudfront.net/external_assets/tutorials/artwork_logos_v1/soldier.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.nombre,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.grey[600],
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.product.precio.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[400],
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 24,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => RatingPage())),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '3.5',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: _addToCart,
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[300].withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                color: Colors.blue[300],
                              ),
                              child: Text(
                                "Añadir al Carrito${count == 0 || count == null ? '' : ' ($count)'}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  buildPetFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              feature,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
  _addToCart() {
    _cartBloc.add(AddProductToCart(widget.product));
  }

}
