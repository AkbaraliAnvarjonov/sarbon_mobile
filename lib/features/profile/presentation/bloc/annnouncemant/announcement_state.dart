part of 'announcement_bloc.dart';

class AnnouncementState extends Equatable {
  const AnnouncementState({
    this.getActiveAnnouncementStatus = ApiStatus.initial,
    this.getInActiveAnnouncementStatus = ApiStatus.initial,
    this.activeAnnouncementList = const [],
    this.inActiveAnnouncementList = const [],
  });

  final ApiStatus getActiveAnnouncementStatus;
  final ApiStatus getInActiveAnnouncementStatus;
  final List<GetActiveInActiveAnnouncementListEntity> activeAnnouncementList;
  final List<GetActiveInActiveAnnouncementListEntity> inActiveAnnouncementList;


  AnnouncementState copyWith({
    ApiStatus? getActiveAnnouncementStatus,
    ApiStatus? getInActiveAnnouncementStatus,
    List<GetActiveInActiveAnnouncementListEntity>? activeAnnouncementList,
    List<GetActiveInActiveAnnouncementListEntity>? inActiveAnnouncementList,
  }) =>
      AnnouncementState(
        getActiveAnnouncementStatus:
            getActiveAnnouncementStatus ?? this.getActiveAnnouncementStatus,
        activeAnnouncementList:
            activeAnnouncementList ?? this.activeAnnouncementList,
        getInActiveAnnouncementStatus:
            getInActiveAnnouncementStatus ?? this.getInActiveAnnouncementStatus,
        inActiveAnnouncementList:
            inActiveAnnouncementList ?? this.inActiveAnnouncementList,
      );

  @override
  List<Object?> get props => [
        getActiveAnnouncementStatus,
        activeAnnouncementList,
        getInActiveAnnouncementStatus,
        inActiveAnnouncementList,
      ];
}
