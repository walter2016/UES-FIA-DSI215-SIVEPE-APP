part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class AddAddress extends AddressEvent {
  final Address adrress;
  AddAddress(this.adrress);

  @override
  List<Object> get props => [adrress];
}

class RemoveAddress extends AddressEvent {
  final Address adrress;
  RemoveAddress(this.adrress);

  @override
  List<Object> get props => [adrress];
}

class LoadAddresses extends AddressEvent {}

class LoadAddressesSuccess extends AddressEvent {
  final List<Address> address;

  LoadAddressesSuccess(this.address);

  @override
  List<Object> get props => [address];
}
