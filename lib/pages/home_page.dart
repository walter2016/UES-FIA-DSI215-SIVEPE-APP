import 'package:com_app_tienda/Cart/cart_page.dart';
import 'package:com_app_tienda/WishList/favorites.dart';
import 'package:com_app_tienda/body/DrawerWidget.dart';
import 'package:com_app_tienda/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'home_tab_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;

  String title = "Home";
  //Color _color = Hexcolor('#FF9800');

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
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
        child: TabBar(
          onTap: (indedx) {
            if (indedx == 0) {
              setState(() {
                title = "Home";
              });
            } else if (indedx == 1) {
              setState(() {
                title = "Wishlist";
              });
            } else if (indedx == 2) {
              setState(() {
                title = "Cart";
              });
            } else if (indedx == 3) {
              setState(() {
                title = "Account";
              });
            }
          },
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Wishlist",
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
              text: "Cart",
            ),
            Tab(
              icon: Icon(Icons.account_circle),
              text: "Account",
            ),
          ],
          controller: tabController,
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
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}

class MyBody extends StatelessWidget {
  final String title;

  MyBody(this.title);

  final mySnackBar = SnackBar(
    content: Text(
      "Hello There!",
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text(title + "  Click me"),
              onPressed: () => {Scaffold.of(context).showSnackBar(mySnackBar)}),
        ],
      ),
    );
  }
}
