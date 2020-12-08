import 'package:com_app_tienda/Address/bloc/address_bloc.dart';
import 'package:com_app_tienda/Address/model/address.dart';
import 'package:com_app_tienda/Address/resources/address_repository.dart';
import 'package:com_app_tienda/Address/ui/address_update_page.dart';
import 'package:com_app_tienda/Address/ui/andress_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListAddress extends StatefulWidget {
  final List<Address> address;
  const ListAddress(this.address);

  @override
  _ListAddressState createState() => _ListAddressState();
}

class _ListAddressState extends State<ListAddress> {
  AddressBloc addressBloc;

  @override
  void initState() {
    super.initState();
    addressBloc = BlocProvider.of<AddressBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.address.length == 0) {
      return Center(
        child: Text('No tiene direcciones'),
      );
    }
    return ListView.builder(
      itemCount: widget.address.length,
      itemBuilder: (_, i) => _createItem(context, i),
    );
  }

  _createItem(BuildContext context, int i) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        onDismissed: (direction) {
          addressBloc.add(RemoveAddress(widget.address[i]));
          // AddressRepository.delete(widget.address[i]);
        },
        child: ListTile(
          title: new Text('${widget.address[i].direccion},' +
              ' ${widget.address[i].numeroCasa}'),
          subtitle: new Text('${widget.address[i].departamento},' +
              ' ${widget.address[i].municipio}'),
          leading: new Icon(Icons.location_on),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  print(context);
                  return AddressUpdatePage(
                    address: widget.address[i],
                  );
                },
              ),
            );
          },
          onLongPress: () {
            //
          },
        ));
  }
}
