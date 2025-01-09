import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'additional_parameters_event.dart';

part 'additional_parameters_state.dart';

class AdditionalParametersBloc
    extends Bloc<AdditionalParametersEvent, AdditionalParametersState> {
  AdditionalParametersBloc() : super(AdditionalParametersInitial()) {
    on<AdditionalParametersEvent>((event, emit) {});
  }
}
