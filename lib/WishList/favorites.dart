import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_bloc.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'FavoriteListItemWidget.dart';
import 'ProductGridItemWidget.dart';

class FavoritesWidget extends StatefulWidget {
  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  DeseosBloc _deseosBloc;
  String layout = 'grid';

  @override
  void initState() {
    super.initState();
    _deseosBloc = BlocProvider.of<DeseosBloc>(context);
  }

  ProductsList _productsList = new ProductsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeseosBloc, DeseosState>(
        cubit: _deseosBloc,
        builder: (BuildContext context, DeseosState state) {
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
                        color: Colors.grey[800],
                      ),
                      title: Text(
                        'Lista de Deseos',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: false,
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
                  offstage: this.layout != 'list' ||
                      _productsList.favoritesList.isEmpty,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: state.lines.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 5);
                    },
                    itemBuilder: (context, index) {
                      return FavoriteListItemWidget(
                        deseoLine: state.lines.elementAt(index),
                        heroTag: 'favorites_list',
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
                  offstage: this.layout != 'grid' ||
                      _productsList.favoritesList.isEmpty,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: new StaggeredGridView.countBuilder(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      itemCount: state.lines.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductGridItemWidget(
                          deseoLine: state.lines.elementAt(index),
                          heroTag: 'favorites_grid',
                        );
                      },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ),
                /*
                  Offstage(
                  offstage: state.lines.isEmpty,
                  child: EmptyFavoritesWidget(),
                )
                */
              ],
            ),
          );
        });
  }
}
