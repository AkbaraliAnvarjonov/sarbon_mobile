part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsListFromArgument extends NewsEvent {
  const GetNewsListFromArgument({
    required this.count,
    required this.news,
  });

  final int count;
  final List<NewsItemEntity> news;

  @override
  List<Object?> get props => [count, news];
}

class GetNewsWithPaginationEvent extends NewsEvent {
  const GetNewsWithPaginationEvent();

  @override
  List<Object?> get props => [];
}

class GetSingleNewsEvent extends NewsEvent {
  const GetSingleNewsEvent();

  @override
  List<Object?> get props => [];
}
