import 'package:com_app_tienda/Tarjetas/ui/card_type.dart';
import 'package:com_app_tienda/Tarjetas/ui/widgets/card_list.dart';
import 'package:flutter/material.dart';

class AgregarTarjetaPerfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AgregarTarjetaPerfilState();
  }
}

class AgregarTarjetaPerfilState extends State<AgregarTarjetaPerfil> {
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardType()));
              },
            )
          ]),
      resizeToAvoidBottomInset: true,
      body: CardList(),
    );
  }
}
