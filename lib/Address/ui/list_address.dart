import 'package:com_app_tienda/Address/bloc/address_bloc.dart';
import 'package:com_app_tienda/Address/model/address.dart';
import 'package:com_app_tienda/Address/resources/address_repository.dart';
import 'package:com_app_tienda/Address/ui/address_update_page.dart';
import 'package:com_app_tienda/Address/ui/andress_add_page.dart';
import 'package:flutter/material.dart';

class ListAddress extends StatelessWidget {
  final List<Address> address;
  const ListAddress(this.address);

  @override
  Widget build(BuildContext context) {
    if (address.length == 0) {
      return Center(
        child: Text('No tiene direcciones'),
      );
    }
    return ListView.builder(
      itemCount: address.length,
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
          print(direction);
          AddressRepository.delete(address[i]);
        },
        child: ListTile(
          title: new Text(
              '${address[i].direccion},' + ' ${address[i].numeroCasa}'),
          subtitle: new Text(
              '${address[i].departamento},' + ' ${address[i].municipio}'),
          leading: new Icon(Icons.location_on),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  print(context);
                  return AddressUpdatePage(
                    address: address[i],
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
