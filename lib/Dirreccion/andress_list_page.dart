import 'package:com_app_tienda/Dirreccion/andress.dart';
import 'package:com_app_tienda/Dirreccion/andress_add_page.dart';
import 'package:flutter/material.dart';

class ListaDireccionPage extends StatefulWidget {
  ListaDireccionPage({Key key}) : super(key: key);

  @override
  _ListaDireccionPageState createState() => _ListaDireccionPageState();
}

class _ListaDireccionPageState extends State<ListaDireccionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: new Icon(Icons.add, color: Color(0xFFFFFFFF)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return DireccionPage();
                    },
                  ),
                );
              })
        ],
        backgroundColor: Color(0xFFFF9800),
        title: const Text('Direcciones'),
      ),
      body: ListView(
        children: direcciones.map(_buildItem).toList(),
      ),
    );
  }
}

Widget _buildItem(Andress andress) {
  return new ListTile(
    title: new Text('${andress.direccion},' + ' ${andress.numeroCasa}'),
    subtitle: new Text('${andress.municipio},' + ' ${andress.departamento}'),
    leading: new Icon(Icons.location_on),
    onTap: () {
      print(andress.direccion);
    },
  );
}
