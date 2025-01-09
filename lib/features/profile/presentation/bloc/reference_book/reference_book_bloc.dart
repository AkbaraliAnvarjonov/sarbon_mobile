import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/entities/reference_book/reference_book_entity.dart';
import '../../../domain/usecases/reference_book_usecase/reference_book_usecase.dart';

part 'reference_book_event.dart';

part 'reference_book_state.dart';

class ReferenceBookBloc extends Bloc<ReferenceBookEvent, ReferenceBookState> {
  ReferenceBookBloc({
    required this.fetchReferenceBookUseCase,
  }) : super(const ReferenceBookState()){
    on<FetchReferenceBookEvent>(_fetchReferenceBook);
  }

  final FetchReferenceBookUseCase fetchReferenceBookUseCase;

  Future<void> _fetchReferenceBook(
    FetchReferenceBookEvent event,
    Emitter<ReferenceBookState> emit,
  ) async {
    emit(state.copyWith(fetchReferenceBookStatus: ApiStatus.loading));
    final response = await fetchReferenceBookUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(fetchReferenceBookStatus: ApiStatus.error));
      },
      (data) {
        emit(
          state.copyWith(
            fetchReferenceBookStatus: ApiStatus.success,
            referenceBook: data.response,
          ),
        );
      },
    );
  }
}
