import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../services/api_status.dart';
import '../../../domain/usecases/fetch_user_agreement_usecase.dart';

part 'user_agreement_event.dart';

part 'user_agreement_state.dart';

class UserAgreementBloc extends Bloc<UserAgreementEvent, UserAgreementState> {
  UserAgreementBloc({
    required this.fetchUserAgreementUseCase,
  }) : super(const UserAgreementState()) {
    on<FetchUserAgreementEvent>(_fetchUserAgreement);
  }

  final FetchUserAgreementUseCase fetchUserAgreementUseCase;

  Future<void> _fetchUserAgreement(
    FetchUserAgreementEvent event,
    Emitter<UserAgreementState> emit,
  ) async {
    emit(state.copyWith(userAgreementStatus: ApiStatus.loading));
    final response = await fetchUserAgreementUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(userAgreementStatus: ApiStatus.error));
      },
      (userAgreement) {
        emit(
          state.copyWith(
            userAgreementStatus: ApiStatus.success,
            userAgreement: userAgreement.response?.first.answer ?? '',
          ),
        );
      },
    );
  }
}
