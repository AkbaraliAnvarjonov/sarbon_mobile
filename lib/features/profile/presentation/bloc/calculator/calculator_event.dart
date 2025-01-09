part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
}

class SetFromAddressEvent extends CalculatorEvent {
  const SetFromAddressEvent({required this.address});

  final AddressModel address;

  @override
  List<Object> get props => [address];
}

class SetToAddressEvent extends CalculatorEvent {
  const SetToAddressEvent({required this.address});

  final AddressModel address;

  @override
  List<Object> get props => [address];
}

class AddAdditionalAddressEvent extends CalculatorEvent {
  const AddAdditionalAddressEvent({required this.address});

  final AddressModel address;

  @override
  List<Object> get props => [address];
}

class RemoveAdditionalAddressEvent extends CalculatorEvent {
  const RemoveAdditionalAddressEvent({required this.addressIndex});

  final int addressIndex;

  @override
  List<Object> get props => [addressIndex];
}
