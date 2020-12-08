import 'package:com_app_tienda/Address/bloc/address_bloc.dart';
import 'package:com_app_tienda/Address/model/address.dart';
import 'package:com_app_tienda/Address/resources/address_repository.dart';
import 'package:com_app_tienda/Address/ui/andress_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressUpdatePage extends StatefulWidget {
  final Address address;
  AddressUpdatePage({this.address});

  @override
  _AddressUpdatePageState createState() => _AddressUpdatePageState();
}

class _AddressUpdatePageState extends State<AddressUpdatePage> {
  AddressBloc addressBloc;
  final _formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();
  final direccionController = TextEditingController();
  final numeroCasaController = TextEditingController();
  final municipioController = TextEditingController();
  final departamentoController = TextEditingController();
  final referenciaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressBloc = BlocProvider.of<AddressBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _init(widget.address);
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.keyboard_backspace, color: Color(0xFFFFFFFF)),
            onPressed: () {
              Navigator.pop(context);
              /*
Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    print(context);
                    return RealizarPago();
                  },
                ),
              );


              */
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
                  controller: direccionController,
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
                  controller: numeroCasaController,
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
                  controller: municipioController,
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
                  controller: departamentoController,
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
                  controller: referenciaController,
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
                      widget.address.direccion = direccionController.text;
                      widget.address.numeroCasa = numeroCasaController.text;
                      widget.address.municipio = municipioController.text;
                      widget.address.departamento = departamentoController.text;
                      widget.address.referencia = referenciaController.text;

                      addressBloc.add(UpdateAddress(widget.address));
                      // AddressRepository.update(widget.address);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ListaAddressPage();
                          },
                        ),
                      );
                    }
                    // print(_formKey.toString());
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
                            "Actualizar Dirección",
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

  _init(Address address) {
    numeroCasaController.text = address.numeroCasa;
    direccionController.text = address.direccion;
    departamentoController.text = address.departamento;
    municipioController.text = address.municipio;
    referenciaController.text = address.referencia;
  }
}
