import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:com_app_tienda/body/category_card_details_page.dart';
import 'package:com_app_tienda/body/category_card_page.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  final BuiltList<CategoryEntity> categories;

  CategoryGrid(this.categories);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            ),
          ),
        ),
      ),
    );
  }
}
