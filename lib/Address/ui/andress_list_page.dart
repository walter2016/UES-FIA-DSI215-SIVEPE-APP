import 'package:com_app_tienda/Address/bloc/address_bloc.dart';
import 'package:com_app_tienda/Address/resources/address_repository.dart';
import 'package:com_app_tienda/Address/ui/andress_add_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class ListaAddressPage extends StatefulWidget {
  ListaAddressPage({Key key}) : super(key: key);

  @override
  _ListaAddressPageState createState() => _ListaAddressPageState();
}

class _ListaAddressPageState extends State<ListaAddressPage> {
  //List direcciones = AddressRepository.address() as List;
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
                      return AddressPage();
                    },
                  ),
                );
              })
        ],
        backgroundColor: Color(0xFFFF9800),
        title: const Text('Direcciones'),
      ),
      body: _AddressPage(),
    );
  }
}

class _AddressPage extends StatefulWidget {
  _AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<_AddressPage> {
  AddressBloc addressBloc;

  @override
  void initState() {
    super.initState();
    addressBloc = BlocProvider.of<AddressBloc>(context);
    addressBloc.add(LoadAddresses());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (BuildContext context, AddressState state) {
        if (state is AddressLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AddressLoaded) {
          return Center(
            child: Text('Si cargaron'),
          );
        }
        if (state is AddressLoadFailure) {
          return Center(
            child: Text('No se pudo cargar los productos'),
          );
        }
        return Container();
      },
    );
  }
}
