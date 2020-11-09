import 'package:com_app_tienda/utilities/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget comentar = InkWell(
      onTap: () async {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 60,
        width: width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Agregar Comentario",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[50]),
          padding: EdgeInsets.all(24.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              '¡Gracias!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RichText(
                text: TextSpan(
                    style:
                        TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Haz tu Calificación a: ',
                      ),
                      TextSpan(
                          text: 'Nombre del Producto',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]))
                    ]),
              ),
            ),
            FlutterRatingBar(
              itemSize: 32,
              allowHalfRating: false,
              initialRating: 1,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              fullRatingWidget: Icon(Icons.star, color: Colors.amber, size: 32),
              noRatingWidget:
                  Icon(Icons.star_border, color: Colors.amber, size: 32),
              onRatingUpdate: (value) {
//              setState(() {
//                rating = value;
//              });

                print(value);
              },
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Di algo sobre el producto.'),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLength: 200,
                )),
            comentar
          ])),
    );
  }
}
