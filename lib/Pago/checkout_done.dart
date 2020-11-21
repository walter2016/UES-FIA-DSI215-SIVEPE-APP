import 'package:com_app_tienda/Ordenes/orders.dart';
import 'package:com_app_tienda/config/app_config.dart' as config;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OrdenDoneWidget extends StatefulWidget {
  @override
  _OrdenDoneWidgetState createState() => _OrdenDoneWidgetState();
}

class _OrdenDoneWidgetState extends State<OrdenDoneWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          textAlign: TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15),
              Stack(
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFff9100),
                              Color(0xFFff9100).withOpacity(0.2),
                            ])),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  Positioned(
                    right: -30,
                    bottom: -50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFff9100).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    top: -50,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFff9100).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Su pedido se procesó correctamente',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 15),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: OrdersWidget()));
                },
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                color: Theme.of(context).focusColor.withOpacity(0.15),
                shape: StadiumBorder(),
                child: Text(
                  'Tus ordenes',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
