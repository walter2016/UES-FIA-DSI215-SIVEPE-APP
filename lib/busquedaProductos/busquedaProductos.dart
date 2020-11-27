import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:com_app_tienda/body/product_card_details_page.dart';
import 'package:com_app_tienda/busquedaProductos/BusquedaProd.dart';
import 'package:com_app_tienda/busquedaProductos/BusquedaProductoGrid.dart';
import 'package:com_app_tienda/busquedaProductos/BusquedaProductoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BusquedaProductosFinal extends StatefulWidget {
  BuiltList<ProductEntity> products;
  BusquedaProductosFinal(this.products);
  @override
  _BusquedaProductosFinalState createState() => _BusquedaProductosFinalState();
}

class _BusquedaProductosFinalState extends State<BusquedaProductosFinal> {
  String layout = 'grid';

  BuiltList<ProductEntity> products;

  @override
  void initState() {
    products = BuiltList.from(widget.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: BarraBusquedaProd(
                  onChange: (String value) {
                    setState(() {
                      if (value.isEmpty) {
                        products = widget.products;
                      }

                      products = BuiltList.from(products.asList().where(
                          (element) => element.nombre
                              .toLowerCase()
                              .contains(value.toLowerCase())));
                    });
                  },
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        this.layout = 'list';
                      });
                    },
                    icon: Icon(
                      Icons.format_list_bulleted,
                      color: this.layout == 'list'
                          ? Color(0xFFff9100)
                          : Theme.of(context).focusColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        this.layout = 'grid';
                      });
                    },
                    icon: Icon(
                      Icons.apps,
                      color: this.layout == 'grid'
                          ? Color(0xFFff9100)
                          : Theme.of(context).focusColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Offstage(
            offstage: this.layout != 'list' || products.isEmpty,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (context, index) {
                return BusquedaProductoListItemWidget(
                    heroTag: 'favorites_list',
                    product: products.elementAt(index),
                    /*onDismissed: () {
                    setState(() {
                      _productsList.favoritesList.removeAt(index);
                    });
                  },*/
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              product: products[index],
                            ),
                          ),
                        ));
              },
            ),
          ),
          Offstage(
            offstage: this.layout != 'grid' || products.isEmpty,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new StaggeredGridView.countBuilder(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductEntity product = products.elementAt(index);
                  return BusquedaProductoGridItemWidget(
                      product: product,
                      heroTag: 'favorites_grid',
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                product: products[index],
                              ),
                            ),
                          ));
                },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
