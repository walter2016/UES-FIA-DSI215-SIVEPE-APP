import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:com_app_tienda/ProductByCategory/categories.dart';
import 'package:com_app_tienda/Products/model/product_entity.dart';
import 'package:flutter/material.dart';

class DetalleCategoria extends StatelessWidget {
  final CategoryEntity category;

  const DetalleCategoria({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductEntity product;
    return Scaffold(
      // each product have a color

      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
/*
          Expanded(
            child: buildSubcategories(),
            flex: 1,
          ),
*/
          Expanded(
            child: Container(
              child: CategoriesWidget(),
            ),
            flex: 4,
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: new IconButton(
          icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
          onPressed: () {
            Navigator.pop(context);
          }),
      backgroundColor: Color(0xFFFF9800),
      title: Text(
        category.nombre,
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget buildSubcategories() {
    return Container(
//      height: MediaQuery.of(context).size.height / 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildSingleSubcategory(
            imgLocation: "assets/images/tshirt.png",
            imgCaption: "T shirt",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/images/tshirt.png",
            imgCaption: "Shoes",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/images/tshirt.png",
            imgCaption: "Jeans",
          ),
          buildSingleSubcategory(
            imgLocation: "assets/images/tshirt.png",
            imgCaption: "Informal",
          ),
        ],
      ),
    );
  }

  Widget buildSingleSubcategory({String imgLocation, String imgCaption}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: <Widget>[
              Image.asset(
                imgLocation,
                scale: 3.5,
              ),
              Text(
                imgCaption,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
