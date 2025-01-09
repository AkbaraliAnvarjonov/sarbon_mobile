import 'package:equatable/equatable.dart';

import '../../data/models/post_rating_review_request_model.dart';

class RatingReviewsRequestEntity extends Equatable {
  final String? companyId;
  final num? grade;
  final String? rewiv;
  final String? usersId;
  final List<String>? reviewStatus;
  final String? usersId2;
  final List<String> status;

  const RatingReviewsRequestEntity({
    this.companyId,
    this.grade,
    this.rewiv,
    this.usersId,
    this.reviewStatus,
    this.usersId2,
    this.status = const [],
  });

  @override
  List<Object?> get props => [
        companyId,
        grade,
        rewiv,
        usersId,
        reviewStatus,
        usersId2,
        status,
      ];
}

extension RatingReviewRequestModelX on RatingReviewsRequestEntity {
  RatingReviewRequestModel get toModel => RatingReviewRequestModel(
        data: RatingReviewData(
          companyId: companyId,
          grade: grade,
          rewiv: rewiv,
          usersId: usersId,
          reviewStatus: reviewStatus,
          usersId2: usersId2,
          status: status,
        ),
      );
}
