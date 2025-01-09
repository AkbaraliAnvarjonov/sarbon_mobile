part of 'complain_bloc.dart';

class ComplainState extends Equatable {
  const ComplainState({
    this.createComplainStatus = ApiStatus.initial,
  });

  final ApiStatus createComplainStatus;

  ComplainState copyWith({
    ApiStatus? createComplainStatus,
  }) =>
      ComplainState(
        createComplainStatus: createComplainStatus ?? ApiStatus.initial,
      );

  @override
  List<Object?> get props => [
        createComplainStatus,
      ];
}
