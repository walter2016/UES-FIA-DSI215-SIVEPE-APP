import 'package:com_app_tienda/Cart/blocs/cart_bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Cart/cart_page.dart';
import 'package:com_app_tienda/WishList/favorites.dart';
import 'package:com_app_tienda/body/DrawerWidget.dart';
import 'package:com_app_tienda/busquedaProductos/busqueda_products.dart';
import 'package:com_app_tienda/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_tab_page.dart';

class HomePage extends StatefulWidget {
  final int initialTab;
  HomePage({this.initialTab});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  CartBloc _cartBloc;
  String title = "Incio";

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    if (widget.initialTab != null) {
      tabController.index = widget.initialTab;
    }
    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      appBar: buildAppBar(),
      body: TabBarView(
        children: <Widget>[
          FirstTab(),
          FavoritesWidget(),
          CartWidget(),
          ProfilePage(),
        ],
// if you want yo disable swiping in tab the use below code
//            physics: NeverScrollableScrollPhysics(),
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Color(0xFFFF9800),
        child: BlocBuilder<CartBloc, CartState>(
          cubit: _cartBloc,
          builder: (BuildContext context, CartState state) {
            int cartCount = 0;
            for (CartLine line in state.lines) {
              cartCount += line.quantity;
            }
            return TabBar(
              onTap: (indedx) {
                if (indedx == 0) {
                  setState(() {
                    title = "Inicio";
                  });
                } else if (indedx == 1) {
                  setState(() {
                    title = "Lista de Deseos";
                  });
                } else if (indedx == 2) {
                  setState(() {
                    title = "Carrito ($cartCount)";
                  });
                } else if (indedx == 3) {
                  setState(() {
                    title = "Cuenta";
                  });
                }
              },
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  text: "Inicio",
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: "Deseos",
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "Carrito ($cartCount)",
                ),
                Tab(
                  icon: Icon(Icons.account_circle),
                  text: "Cuenta",
                ),
              ],
              controller: tabController,
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFFF9800),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return BusquedaProductos();
            }));
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return HomePage(
                initialTab: 3,
              );
            }));
          },
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}
