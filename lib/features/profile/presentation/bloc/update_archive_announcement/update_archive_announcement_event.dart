part of 'update_archive_announcement_bloc.dart';

abstract class UpdateArchiveAnnouncementEvent extends Equatable {
  const UpdateArchiveAnnouncementEvent();
}

class GetInformationUpdateArchiveEvent extends UpdateArchiveAnnouncementEvent {
  const GetInformationUpdateArchiveEvent();

  @override
  List<Object?> get props => [];
}

class SelectCarTypeEvent extends UpdateArchiveAnnouncementEvent {
  const SelectCarTypeEvent({
    required this.selectedCarType,
  });

  final TypeCarsListEntity selectedCarType;

  @override
  List<Object?> get props => [selectedCarType];
}

class SelectAddressSaleCarEvent extends UpdateArchiveAnnouncementEvent {
  const SelectAddressSaleCarEvent({
    required this.selectedAddress,
  });

  final AddressesListEntity selectedAddress;

  @override
  List<Object?> get props => [selectedAddress];
}

class SelectCurrencyEvent extends UpdateArchiveAnnouncementEvent {
  const SelectCurrencyEvent({
    required this.selectedCurrency,
  });

  final TypeCurrencyListEntity selectedCurrency;

  @override
  List<Object?> get props => [selectedCurrency];
}

class SelectImageEvent extends UpdateArchiveAnnouncementEvent {
  const SelectImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class ChangeStatusEvent extends UpdateArchiveAnnouncementEvent {
  const ChangeStatusEvent();

  @override
  List<Object?> get props => [];
}

class UpdateAnnouncementEvent extends UpdateArchiveAnnouncementEvent {
  const UpdateAnnouncementEvent({
    required this.updateAnnouncementRequest,
  });

  final CreateAndUpdateAnnouncementRequest updateAnnouncementRequest;

  @override
  List<Object?> get props => [updateAnnouncementRequest];
}