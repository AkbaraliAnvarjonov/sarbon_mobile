part of 'update_active_announcement_bloc.dart';

abstract class UpdateActiveAnnouncementEvent extends Equatable {
  const UpdateActiveAnnouncementEvent();
}

class GetInformationUpdateActiveEvent extends UpdateActiveAnnouncementEvent {
  const GetInformationUpdateActiveEvent();

  @override
  List<Object?> get props => [];
}

class SelectCarTypeEvent extends UpdateActiveAnnouncementEvent {
  const SelectCarTypeEvent({
    required this.selectedCarType,
  });

  final TypeCarsListEntity selectedCarType;

  @override
  List<Object?> get props => [selectedCarType];
}

class SelectAddressSaleCarEvent extends UpdateActiveAnnouncementEvent {
  const SelectAddressSaleCarEvent({
    required this.selectedAddress,
  });

  final AddressesListEntity selectedAddress;

  @override
  List<Object?> get props => [selectedAddress];
}

class SelectCurrencyEvent extends UpdateActiveAnnouncementEvent {
  const SelectCurrencyEvent({
    required this.selectedCurrency,
  });

  final TypeCurrencyListEntity selectedCurrency;

  @override
  List<Object?> get props => [selectedCurrency];
}

class SelectImageEvent extends UpdateActiveAnnouncementEvent {
  const SelectImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class ChangeApiStatusEvent extends UpdateActiveAnnouncementEvent {
  const ChangeApiStatusEvent();

  @override
  List<Object?> get props => [];
}

class UpdateAnnouncementStatusEvent extends UpdateActiveAnnouncementEvent {
  const UpdateAnnouncementStatusEvent({
    required this.status,
  });

  final String status;

  @override
  List<Object?> get props => [status];
}

class UpdateAnnouncementEvent extends UpdateActiveAnnouncementEvent {
  const UpdateAnnouncementEvent({
    required this.updateAnnouncementRequest,
  });

  final CreateAndUpdateAnnouncementRequest updateAnnouncementRequest;

  @override
  List<Object?> get props => [updateAnnouncementRequest];
}
