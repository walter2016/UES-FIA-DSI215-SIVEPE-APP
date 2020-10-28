import 'package:com_app_tienda/Cart/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'EmptyFavoritesWidget.dart';
import 'FavoriteListItemWidget.dart';
import 'ProductGridItemWidget.dart';

class FavoritesWidget extends StatefulWidget {
  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  String layout = 'grid';
  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Offstage(
            offstage: _productsList.favoritesList.isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                leading: Icon(
                  Icons.favorite,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  'Wish List',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.display1,
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
          ),
          Offstage(
            offstage:
                this.layout != 'list' || _productsList.favoritesList.isEmpty,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: _productsList.favoritesList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (context, index) {
                return FavoriteListItemWidget(
                  heroTag: 'favorites_list',
                  product: _productsList.favoritesList.elementAt(index),
                  onDismissed: () {
                    setState(() {
                      _productsList.favoritesList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Offstage(
            offstage:
                this.layout != 'grid' || _productsList.favoritesList.isEmpty,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new StaggeredGridView.countBuilder(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount: _productsList.favoritesList.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product =
                      _productsList.favoritesList.elementAt(index);
                  return ProductGridItemWidget(
                    product: product,
                    heroTag: 'favorites_grid',
                  );
                },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
          Offstage(
            offstage: _productsList.favoritesList.isNotEmpty,
            child: EmptyFavoritesWidget(),
          )
        ],
      ),
    );
  }
}
