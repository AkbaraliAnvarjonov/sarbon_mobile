part of 'reference_book_bloc.dart';

class ReferenceBookState extends Equatable {
  const ReferenceBookState({
    this.fetchReferenceBookStatus = ApiStatus.initial,
    this.referenceBook = const [],
  });

  final ApiStatus fetchReferenceBookStatus;
  final List<ReferenceBookResponseEntity> referenceBook;

  ReferenceBookState copyWith({
    ApiStatus? fetchReferenceBookStatus,
    List<ReferenceBookResponseEntity>? referenceBook,
  }) =>
      ReferenceBookState(
        fetchReferenceBookStatus:
            fetchReferenceBookStatus ?? this.fetchReferenceBookStatus,
        referenceBook: referenceBook ?? this.referenceBook,
      );

  @override
  List<Object?> get props => [
        fetchReferenceBookStatus,
        referenceBook,
      ];
}
