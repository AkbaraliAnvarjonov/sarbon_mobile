import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/api_status.dart';
import '../../../data/models/complain/create_complain_request.dart';
import '../../../domain/usecases/complain/create_complain_usecase.dart';

part 'complain_event.dart';

part 'complain_state.dart';

class ComplainBloc extends Bloc<ComplainEvent, ComplainState> {
  ComplainBloc({
    required this.createComplainUseCase,
  }) : super(const ComplainState()) {
    on<CreateComplainEvent>(_createComplain);
  }

  final CreateComplainUseCase createComplainUseCase;

  Future<void> _createComplain(
    CreateComplainEvent event,
    Emitter<ComplainState> emit,
  ) async {
    emit(state.copyWith(createComplainStatus: ApiStatus.loading));
    final response = await createComplainUseCase(event.request);
    response.fold(
      (failure) {
        emit(state.copyWith(createComplainStatus: ApiStatus.error));
      },
      (data) {
        emit(state.copyWith(createComplainStatus: ApiStatus.success));
      },
    );
  }
}
