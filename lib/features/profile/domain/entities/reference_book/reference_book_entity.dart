import 'package:equatable/equatable.dart';

import '../../../data/models/reference_book/reference_book_response.dart';

class ReferenceBookEntity extends Equatable {
  final List<ReferenceBookResponseEntity> response;

  const ReferenceBookEntity({
    required this.response,
  });

  @override
  List<Object?> get props => [
        response,
      ];
}

class ReferenceBookResponseEntity extends Equatable {
  final String? title;
  final String? description;

  const ReferenceBookResponseEntity({
    this.title,
    this.description,
  });

  @override
  List<Object?> get props => [
        title,
        description,
      ];
}

extension ReferenceBookEntityX on ReferenceBookResponse {
  ReferenceBookEntity get toEntity => ReferenceBookEntity(
        response: data?.data?.response
                ?.map(
                  (e) => ReferenceBookResponseEntity(
                    title: e.question,
                    description: e.answear,
                  ),
                )
                .toList() ??
            [],
      );
}
