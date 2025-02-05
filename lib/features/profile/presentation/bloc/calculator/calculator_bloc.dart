import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarbon_mobile/services/api_status.dart';

import '../../../data/models/address/address_model.dart';

part 'calculator_event.dart';

part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<SetFromAddressEvent>(_setFromAddress);
    on<SetToAddressEvent>(_setToAddress);
    on<AddAdditionalAddressEvent>(_addAdditionalAddress);
    on<RemoveAdditionalAddressEvent>(_removeAdditionalAddress);
    on<ChangeStatusEvent>(_changeStatus);
  }

  void _setFromAddress(
    SetFromAddressEvent event,
    Emitter<CalculatorState> emit,
  ) {
    emit(state.copyWith(fromAddress: event.address));
  }

  void _changeStatus(
    ChangeStatusEvent event,
    Emitter<CalculatorState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }

  void _setToAddress(
    SetToAddressEvent event,
    Emitter<CalculatorState> emit,
  ) {
    emit(state.copyWith(toAddress: event.address));
  }

  void _addAdditionalAddress(
    AddAdditionalAddressEvent event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        addAdditionalAddresses: [
          ...state.addAdditionalAddresses,
          event.address,
        ],
      ),
    );
  }

  void _removeAdditionalAddress(
    RemoveAdditionalAddressEvent event,
    Emitter<CalculatorState> emit,
  ) {
    final List<AddressModel> newAddresses = [
      ...state.addAdditionalAddresses,
    ];
    newAddresses.removeAt(event.addressIndex);
    emit(
      state.copyWith(
        addAdditionalAddresses: newAddresses,
      ),
    );
  }
}
