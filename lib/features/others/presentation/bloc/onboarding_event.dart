part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

class OnBoardingTabChangedEvent extends OnBoardingEvent {
  const OnBoardingTabChangedEvent({required this.currentPage});

  final int currentPage;

  @override
  List<Object> get props => [currentPage];
}
