import 'package:com_app_tienda/Categories/ui/categories_tab.dart';
import 'package:com_app_tienda/Products/ui/products_tab.dart';
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
            CategoriesTab(),
            ProductsTabs(),
            ProductsTabs(),
          ],
        ),
      ),
    );
  }
}


