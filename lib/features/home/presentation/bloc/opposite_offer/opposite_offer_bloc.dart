import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/opposite_offer/put_opposite_offer_request_model.dart';
import '../../../domain/entities/opposite_offer/fetch_currency_entity.dart';
import '../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../../domain/usecases/fetch_currency_usecase.dart';
import '../../../domain/usecases/get_vehicle_types_usecase.dart';
import '../../../domain/usecases/post_opposite_offer_usecase.dart';
import '../../../domain/usecases/put_opposite_offer_usecase.dart';

part 'opposite_offer_event.dart';

part 'opposite_offer_state.dart';

class OppositeOfferBloc extends Bloc<OppositeOfferEvent, OppositeOfferState> {
  OppositeOfferBloc({
    required this.getVehicleTypesUseCase,
    required this.putOppositeOfferUseCase,
    required this.postOppositeOfferUseCase,
    required this.fetchCurrencyUseCase,
  }) : super(const OppositeOfferState()) {
    on<GetVehicleTypesEvent>(_getVehicleTypes);
    on<SelectVehicleTypesEvent>(_selectVehicleType);
    on<GetPrepaymentTabIndexEvent>(_getPrepaymentTabIndex);
    on<GetPayAfterCompletionTabIndexEvent>(_getPayAfterCompletionTabIndex);
    on<WritePrepaymentPercentageEvent>(_writePrepaymentPercentage);
    on<WritePrepaymentAmountEvent>(_writePrepaymentAmount);
    on<WriteAfterCompletionPercentageEvent>(_writeAfterCompletionPercentage);
    on<WriteAfterCompletionAmountEvent>(_writeAfterCompletionAmount);
    on<ButtonPressedEvent>(_buttonPressed);
    on<FetchCurrencyEvent>(_fetchCurrency);
    on<SelectCurrencyEvent>(_selectCurrency);
    on<SelectPaymentMethodEvent>(_changePaymentMethodStatus);
    on<ChangePercentageStatusEvent>(_showPercentage);
    on<ChangeDriverCashEvent>(_writeDriverCash);
    on<ChangePrepaymentCashEvent>(_writePrepaymentCash);
  }

  final GetVehicleTypesUseCase getVehicleTypesUseCase;
  final PutOppositeOfferUseCase putOppositeOfferUseCase;
  final PostOppositeOfferUseCase postOppositeOfferUseCase;
  final FetchCurrencyUseCase fetchCurrencyUseCase;

  Future<void> _getVehicleTypes(
    GetVehicleTypesEvent event,
    Emitter<OppositeOfferState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await getVehicleTypesUseCase(
      const GetVehicleTypesParams(
        limit: 300,
        offset: 0,
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        emit(
          state.copyWith(
            vehicleTypes: r.vehicleTypes,
            status: ApiStatus.initial,
          ),
        );
        add(const FetchCurrencyEvent());
      },
    );
  }

  void _selectVehicleType(
    SelectVehicleTypesEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(selectedVehicleType: event.vehicleType));

  void _getPrepaymentTabIndex(
    GetPrepaymentTabIndexEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(prepaymentTabIndex: event.index));

  void _getPayAfterCompletionTabIndex(
    GetPayAfterCompletionTabIndexEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(payAfterCompletionTabIndex: event.index));

  void _writePrepaymentPercentage(
    WritePrepaymentPercentageEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(prepaymentPercentage: event.percentage));

  void _writePrepaymentAmount(
    WritePrepaymentAmountEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(prepaymentAmount: event.amount));

  void _writeAfterCompletionPercentage(
    WriteAfterCompletionPercentageEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(afterCompletionPercentage: event.percentage));

  void _writeAfterCompletionAmount(
    WriteAfterCompletionAmountEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(afterCompletionAmount: event.amount));

  Future<void> _buttonPressed(
    ButtonPressedEvent event,
    Emitter<OppositeOfferState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    await _putOppositeOffer(
      guid: event.guid,
      firmId: event.firmId,
      usersId2: event.userId2,
      driverComment: event.driverComment,
      selectedVehicleId: event.selectedVehicleId,
      selectedVehicleName: event.selectedVehicleName,
      prepaymentAmount: event.prepaymentAmount,
      driverCash: event.driverCash,
      emit: emit,
    );
    if (!state.status.isError) {
      emit(state.copyWith(status: ApiStatus.success));
    }
  }

  Future<void> _putOppositeOffer({
    required String guid,
    required String usersId2,
    required String driverComment,
    required String firmId,
    required String selectedVehicleId,
    required String selectedVehicleName,
    required int prepaymentAmount,
    required int driverCash,
    required Emitter<OppositeOfferState> emit,
  }) async {
    final response = await putOppositeOfferUseCase(
      PutOppositeOfferParams(
        request: PutOppositeOfferRequestModel(
          data: OppositeOfferRequestData(
            cargoId: guid,
            firmId2: firmId,
            carType: selectedVehicleName,
            vehicleId: selectedVehicleId,
            currencyId: state.selectedCurrency?.guid ?? '',
            comment: driverComment,
            usersId: localSource.userId,
            offers: driverCash.toDouble(),
            paymentType: [
              if (state.paymentMethodStatus == 'payment_after_completed') 'after_payment' else 'prepayment',
            ],
            usersId2: usersId2,
            firmId: localSource.firmId,
            prepayment: (state.paymentMethodStatus == 'payment_after_completed' ? 0 : prepaymentAmount).toDouble(),
          ),
        ),
      ),
    );
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) async {
        await _postOppositeOffer(guid: guid, emit: emit);
        emit(state.copyWith(status: ApiStatus.success));
      },
    );
  }

  Future<void> _postOppositeOffer({
    required String guid,
    required Emitter<OppositeOfferState> emit,
  }) async {
    final result = await postOppositeOfferUseCase(
      PostOppositeOfferParams(
        orderId: guid,
      ),
    );
    result.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {},
    );
  }

  Future<void> _fetchCurrency(
    FetchCurrencyEvent event,
    Emitter<OppositeOfferState> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final response = await fetchCurrencyUseCase(NoParams());
    response.fold(
      (l) => emit(state.copyWith(status: ApiStatus.error)),
      (r) {
        if (r.currency.isNotEmpty && state.selectedCurrency == null) {
          for (final currency in r.currency) {
            if (currency.code == 'USD') {
              add(
                SelectCurrencyEvent(
                  currency: currency,
                ),
              );
              break;
            }
          }
        }
        emit(
          state.copyWith(
            currencyList: r.currency,
            status: ApiStatus.initial,
          ),
        );
      },
    );
  }

  void _selectCurrency(
    SelectCurrencyEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(selectedCurrency: event.currency));

  void _changePaymentMethodStatus(
    SelectPaymentMethodEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(paymentMethodStatus: event.status));

  void _showPercentage(
    ChangePercentageStatusEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(showPercentage: !state.showPercentage));

  void _writeDriverCash(
    ChangeDriverCashEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(driverCash: event.driverCash));

  void _writePrepaymentCash(
    ChangePrepaymentCashEvent event,
    Emitter<OppositeOfferState> emit,
  ) =>
      emit(state.copyWith(prepaymentCash: event.prepaymentCash));
}
