import 'package:com_app_tienda/Categories/model/category_entity.dart';
import 'package:flutter/material.dart';

class ListaCategorias extends StatelessWidget {
  final CategoryEntity category;
  final Function press;
  const ListaCategorias({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: category.id.toString(),
                child: Container(
                  width: (size.width - 16) / 3,
                  height: (size.width - 16) / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://d2f7anuvnar8n5.cloudfront.net/external_assets/tutorials/artwork_logos_v1/soldier.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  category.nombre,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
