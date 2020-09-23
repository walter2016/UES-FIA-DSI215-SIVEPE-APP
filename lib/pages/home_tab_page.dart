import 'package:com_app_tienda/Service/category_service.dart';
import 'package:com_app_tienda/body/category_card_details_page.dart';
import 'package:com_app_tienda/body/category_card_page.dart';
import 'package:com_app_tienda/body/product_card_details_page.dart';
import 'package:com_app_tienda/body/product_card_page.dart';
import 'package:com_app_tienda/models/Category.dart';
import 'package:com_app_tienda/models/Product.dart';
import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;

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
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Color(0xFFFF9800),
            height: 40.0,
            child: new TabBar(
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: "CATEGORIES",
                ),
                Tab(
                  text: "TOP",
                ),
                Tab(
                  text: "OFFER",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Category>>(
              future: getCategorias(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return _ListCategory(snapshot.data);
                }
              },
            ),
            FutureBuilder<List<Product>>(
              future: getProductos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return _ListProduct(snapshot.data);
                }
              },
            ),
            FutureBuilder<List<Product>>(
              future: getProductos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return _ListProduct(snapshot.data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  final List<Category> categories;

  _ListCategory(this.categories);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) => ListaCategorias(
                  category: categories[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleCategoria(
                          category: categories[index],
                        ),
                      )),
                )),
      ),
    );
  }
}

class _ListProduct extends StatelessWidget {
  final List<Product> products;

  _ListProduct(this.products);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) => ListaProductos(
                  product: products[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleProductos(
                          product: products[index],
                        ),
                      )),
                )),
      ),
    );
  }
}
