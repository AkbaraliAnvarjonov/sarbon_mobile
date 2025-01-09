part of 'calculator_bloc.dart';

class CalculatorState extends Equatable {
  const CalculatorState({
    this.fromAddress,
    this.toAddress,
    this.addAdditionalAddresses = const [],
  });

  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final List<AddressModel> addAdditionalAddresses;

  CalculatorState copyWith({
    AddressModel? fromAddress,
    AddressModel? toAddress,
    List<AddressModel>? addAdditionalAddresses,
  }) =>
      CalculatorState(
        fromAddress: fromAddress ?? this.fromAddress,
        toAddress: toAddress ?? this.toAddress,
        addAdditionalAddresses:
            addAdditionalAddresses ?? this.addAdditionalAddresses,
      );

  @override
  List<Object?> get props => [
        fromAddress,
        toAddress,
        addAdditionalAddresses,
      ];
}
