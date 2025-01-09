part of 'reference_book_bloc.dart';

abstract class ReferenceBookEvent extends Equatable {
  const ReferenceBookEvent();
}

class FetchReferenceBookEvent extends ReferenceBookEvent {
  const FetchReferenceBookEvent();

  @override
  List<Object?> get props => [];
}