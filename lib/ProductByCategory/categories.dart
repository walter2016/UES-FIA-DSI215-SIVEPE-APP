import 'package:com_app_tienda/Cart/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'EmptyProductByCategoryWidget.dart';
import 'ProductByCategoryListItemWidget.dart';
import 'ProductByCategoryGridItemWidget.dart';
import 'SearchBarWidget.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  String layout = 'grid';
  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: <Widget>[
          Offstage(
            offstage: _productsList.favoritesList.isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: SearchBarWidget(),
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
                return CategoryListItemWidget(
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
                  return ProductByCategoryGridItemWidget(
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
            child: EmptyProductByCategoryFavoritesWidget(),
          )
        ],
      ),
    );
  }
}
