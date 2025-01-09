part of 'create_announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();
}

class GetInformationEvent extends AnnouncementEvent {
  const GetInformationEvent();

  @override
  List<Object?> get props => [];
}

class SelectCarTypeEvent extends AnnouncementEvent {
  const SelectCarTypeEvent({
    required this.selectedCarType,
  });

  final TypeCarsListEntity selectedCarType;

  @override
  List<Object?> get props => [selectedCarType];
}

class SelectAddressSaleCarEvent extends AnnouncementEvent {
  const SelectAddressSaleCarEvent({
    required this.selectedAddress,
  });

  final AddressesListEntity selectedAddress;

  @override
  List<Object?> get props => [selectedAddress];
}

class SelectCurrencyEvent extends AnnouncementEvent {
  const SelectCurrencyEvent({
    required this.selectedCurrency,
  });

  final TypeCurrencyListEntity selectedCurrency;

  @override
  List<Object?> get props => [selectedCurrency];
}

class SelectImageEvent extends AnnouncementEvent {
  const SelectImageEvent({
    required this.imageFile,
  });

  final File imageFile;

  @override
  List<Object?> get props => [imageFile];
}

class CreateAnnouncementEvent extends AnnouncementEvent {
  const CreateAnnouncementEvent({
    required this.createAnnouncementRequest,
  });

  final CreateAndUpdateAnnouncementRequest createAnnouncementRequest;

  @override
  List<Object?> get props => [createAnnouncementRequest];
}

class ChangeStatusEvent extends AnnouncementEvent {
  const   ChangeStatusEvent();

  @override
  List<Object?> get props => [];
}
