part of 'announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();
}

class GetActiveAnnouncementEvent extends AnnouncementEvent {
  const GetActiveAnnouncementEvent();

  @override
  List<Object> get props => [];
}

class GetInActiveAnnouncementEvent extends AnnouncementEvent {
  const GetInActiveAnnouncementEvent();

  @override
  List<Object> get props => [];
}
