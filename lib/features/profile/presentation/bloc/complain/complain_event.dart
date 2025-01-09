part of 'complain_bloc.dart';

abstract class ComplainEvent extends Equatable {
  const ComplainEvent();
}

class CreateComplainEvent extends ComplainEvent {
  const CreateComplainEvent({
    required this.request,
  });

  final CreateComplainRequest request;

  @override
  List<Object?> get props => [request];
}