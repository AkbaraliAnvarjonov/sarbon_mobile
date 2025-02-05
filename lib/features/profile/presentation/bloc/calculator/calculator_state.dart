part of 'calculator_bloc.dart';

class CalculatorState extends Equatable {
  const CalculatorState({
    this.fromAddress,
    this.toAddress,
    this.status = ApiStatus.initial,
    this.addAdditionalAddresses = const [],
  });

  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final List<AddressModel> addAdditionalAddresses;
  final ApiStatus status;

  CalculatorState copyWith({
    AddressModel? fromAddress,
    AddressModel? toAddress,
    ApiStatus? status,
    List<AddressModel>? addAdditionalAddresses,
  }) =>
      CalculatorState(
        fromAddress: fromAddress ?? this.fromAddress,
        toAddress: toAddress ?? this.toAddress,
        status: status ?? this.status,
        addAdditionalAddresses: addAdditionalAddresses ?? this.addAdditionalAddresses,
      );

  @override
  List<Object?> get props => [
        fromAddress,
        toAddress,
        status,
        addAdditionalAddresses,
      ];
}
