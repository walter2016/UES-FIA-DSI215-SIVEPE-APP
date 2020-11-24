import 'package:flutter/material.dart';

class DireccionPage extends StatefulWidget {
  DireccionPage({Key key}) : super(key: key);

  @override
  _DireccionPageState createState() => _DireccionPageState();
}

class _DireccionPageState extends State<DireccionPage> {
  final _formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xFFFF9800),
        title: const Text('Agregar Dirección'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Dirección de Envío",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Ej. Colonia Ejemplo,Pasaje ABC',
                      labelText: 'Dirreccion',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Ej, Casa #54-2A',
                      labelText: 'Numero de Casa o Departamento',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Ej, Santa Tecla',
                      labelText: 'Municipio',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Ej, La Libertad',
                      labelText: 'Departamento',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Ej, Primer Porton, Frente a la Ferreteria',
                      labelText: 'Punto de Referencia',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: Color(0xFFff9100),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      final snackBar = SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('Direccion Guardada Correctamente'));
                      globalKey.currentState.showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Guardar Dirección",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
