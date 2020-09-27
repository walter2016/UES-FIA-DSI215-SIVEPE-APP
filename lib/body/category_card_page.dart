import 'package:com_app_tienda/models/Category.dart';
import 'package:flutter/material.dart';

class ListaCategorias extends StatelessWidget {
  final Category category;
  final Function press;
  const ListaCategorias({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: category.id,
                child: Text('IMAGEN'),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
            child: Text(
              // products is out demo list
              category.nombre,
              style: TextStyle(color: Color(0xFFACACAC)),
            ),
          ),
          /*
          Text(
            "${category.description}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
          */
        ],
      ),
    );
  }
}
