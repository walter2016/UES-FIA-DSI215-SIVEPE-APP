import 'package:com_app_tienda/Pago/checkout_done.dart';
import 'package:com_app_tienda/Tarjetas/ui/card_type.dart';
import 'package:com_app_tienda/Tarjetas/ui/widgets/card_list.dart';
import 'package:flutter/material.dart';

class AgregarTarjeta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AgregarTarjetaState();
  }
}

class AgregarTarjetaState extends State<AgregarTarjeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFff9100),
        title: Text(
          "Seleccion de Tarjeta",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
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
      resizeToAvoidBottomInset: true,
      body: CardList(),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return OrdenDoneWidget();
                            },
                          ),
                        );
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
