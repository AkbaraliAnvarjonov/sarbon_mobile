import 'package:equatable/equatable.dart';

import '../../../data/models/news/get_news_response_model.dart';

class GetNewsResponseEntity extends Equatable {
  const GetNewsResponseEntity({
    required this.count,
    required this.news,
  });

  final int count;
  final List<NewsItemEntity> news;

  @override
  List<Object?> get props => [news];
}

class NewsItemEntity {
  const NewsItemEntity({
    required this.authorId,
    required this.comment,
    required this.date,
    required this.guid,
    required this.tag,
    required this.title,
    required this.photo,
  });

  final String authorId;
  final String comment;
  final String date;
  final String guid;
  final String title;
  final String photo;
  final String tag;
}

extension GetNewsResponseEntityX on GetNewsResponseModel {
  GetNewsResponseEntity toEntity() => GetNewsResponseEntity(
        count: data?.newsData?.count ?? 0,
        news: data?.newsData?.response
                ?.map(
                  (news) => NewsItemEntity(
                    authorId: news.guid ?? '',
                    comment: news.comment ?? '',
                    date: news.date ?? '',
                    guid: news.guid ?? '',
                    title: news.title ?? '',
                    tag: news.tag ?? '',
                    photo: news.photo ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
