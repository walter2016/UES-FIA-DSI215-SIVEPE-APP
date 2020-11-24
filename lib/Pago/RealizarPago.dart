import 'package:com_app_tienda/Cart/CartItemWidget.dart';
import 'package:com_app_tienda/Cart/product.dart';
import 'package:com_app_tienda/Dirreccion/andress_add_page.dart';
import 'package:com_app_tienda/Dirreccion/andress_list_page.dart';
import 'package:com_app_tienda/Pago/AgregarTarjeta.dart';

import 'package:com_app_tienda/Pago/PagoItemWidget.dart';
import 'package:com_app_tienda/Pago/checkout_done.dart';
import 'package:flutter/material.dart';

class RealizarPago extends StatefulWidget {
  @override
  _RealizarPagoState createState() => _RealizarPagoState();
}

class _RealizarPagoState extends State<RealizarPago> {
  ProductsList _productsList;
  bool _bloquearCheck1 = false;
  bool _bloquearCheck2 = false;
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
          "Realizar Pedido",
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
                  "Metodo de Pago",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text('Efectivo'),
              secondary: Icon(Icons.attach_money),
              value: _bloquearCheck1,
              onChanged: (valor) {
                setState(() {
                  _bloquearCheck2 = false;
                  _bloquearCheck1 = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Tarjeta'),
              secondary: Icon(Icons.credit_card),
              value: _bloquearCheck2,
              onChanged: (valor) {
                setState(() {
                  _bloquearCheck1 = false;
                  _bloquearCheck2 = valor;
                });
              },
            ),
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ListaDireccionPage();
                        },
                      ),
                    );
                  },
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
                          "Gastos de envío incluidos",
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
                    width: 180.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Color(0xFFff9100),
                      child: Text(
                        "Realizar Pedido".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_bloquearCheck1 = _bloquearCheck2) {
                          //Aqui escuando se ha seleccionado Tarjeta
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AgregarTarjeta();
                              },
                            ),
                          );
                        } else {
                          //Aqui escuando se ha seleccionado Efectivo
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return OrdenDoneWidget();
                              },
                            ),
                          );
                        }
                      },
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
