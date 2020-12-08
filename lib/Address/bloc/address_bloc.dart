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
    if (event is AddressLoaded)
      yield* _mapLoadAddressToState();
    else if (event is AddAddress) {
      // yield* _mapRemoveProductFromCartState(event);
    } else if (event is RemoveAddress) {
      // yield* _mapRemoveProductFromCartState(event);
    }
  }

  Stream<AddressState> _mapLoadAddressToState() async* {
    yield AddressLoadInProgress();
    try {
      final address = await addressRepository.address();
      add(LoadAddressesSuccess(address.toList()));
    } catch (e) {
      print(e);
      yield AddressLoadFailure();
    }
  }
}
