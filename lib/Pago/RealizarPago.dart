import 'package:com_app_tienda/Cart/CartItemWidget.dart';
import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Pago/AgregarTarjeta.dart';
import 'package:com_app_tienda/Pago/AgregarTarjeta2.dart';
import 'package:com_app_tienda/Pago/AgregarTarjeta3.dart';
import 'package:com_app_tienda/Pago/PagoItemWidget.dart';
import 'package:flutter/material.dart';

class RealizarPago extends StatefulWidget {
  @override
  _RealizarPagoState createState() => _RealizarPagoState();
}

class _RealizarPagoState extends State<RealizarPago> {
  ProductsList _productsList;
  @override
  void initState() {
    _productsList = new ProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _activar = false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFff9100),
        title: Text(
          "Realizar Pago",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 130),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Dirección de Envío",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text(
                "John Doe",
                style: TextStyle(
                  //                    fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("1278 Loving Acres Road Kansas City, MO 64110"),
            ),
            SizedBox(height: 10.0),
            IgnorePointer(
              ignoring: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tarjeta de Credito",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AgregarTarjeta();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline_sharp,
                    ),
                    tooltip: 'Agregar Tarjeta',
                  ),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: _activar,
              child: FlatButton(
                onPressed: () {},
                onLongPress: () {},
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text("John Doe"),
                    subtitle: Text(
                      "5506 7744 8610 9638",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    leading: Icon(
                      Icons.credit_card,
                      size: 40.0,
                      color: Color(0xFFff9100),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Productos",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            //Poner aqui los Productos
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: _productsList.cartList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 1);
              },
              itemBuilder: (context, index) {
                return PagoItemWidget(
                    product: _productsList.cartList.elementAt(index),
                    heroTag: 'cart');
              },
            ),
          ],
        ),
      ),
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          r"$ 212",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFff9100),
                          ),
                        ),
                        Text(
                          "Delivery charges included",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Color(0xFFff9100),
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 100,
        ),
      ),
    );
  }
}
