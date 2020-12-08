import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:com_app_tienda/Address/model/address.dart';
import 'package:com_app_tienda/Address/resources/address_repository.dart';
import 'package:equatable/equatable.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;
  AddressBloc({this.addressRepository}) : super(AddressLoadInProgress());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    if (event is LoadAddresses)
      yield* _mapLoadAddressToState();
    else if (event is AddAddress) {
      yield* _mapAddAddress(event);
    } else if (event is RemoveAddress) {
      yield* _mapRemoveAddress(event);
    } else if (event is LoadAddressesSuccess) {
      yield* _mapLoadProductsSuccess(event);
    } else if (event is UpdateAddress) {
      yield* _mapUpdateAddress(event);
    }
  }

  Stream<AddressState> _mapLoadAddressToState() async* {
    yield AddressLoadInProgress();
    try {
      final address = await AddressRepository.address();
      add(LoadAddressesSuccess(address.toList()));
    } catch (e) {
      print(e);
      yield AddressLoadFailure();
    }
  }

  Stream<AddressState> _mapLoadProductsSuccess(
      LoadAddressesSuccess event) async* {
    yield AddressLoaded(event.address);
  }

  Stream<AddressState> _mapRemoveAddress(RemoveAddress event) async* {
    //
    List<Address> addres = [...((state as AddressLoaded).address)];

    int index =
        addres.lastIndexWhere((element) => element.id == event.adrress.id);
    AddressRepository.delete(addres[index]);

    yield AddressLoaded(addres);
  }

  Stream<AddressState> _mapUpdateAddress(UpdateAddress event) async* {
    //
    List<Address> addres = [...((state as AddressLoaded).address)];

    int index =
        addres.lastIndexWhere((element) => element.id == event.adrress.id);
    AddressRepository.update(addres[index]);

    yield AddressLoaded(addres);
  }

  Stream<AddressState> _mapAddAddress(AddAddress event) async* {
    //
    Address address = event.adrress;

    AddressRepository.insertar(address);

    //yield AddressLoaded(addres);
  }
}
