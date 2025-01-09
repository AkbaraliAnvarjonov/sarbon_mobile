import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(const OnBoardingState()) {
    on<OnBoardingTabChangedEvent>(_tabChanged);
  }

  void _tabChanged(
    OnBoardingTabChangedEvent event,
    Emitter<OnBoardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.currentPage));
  }
}
