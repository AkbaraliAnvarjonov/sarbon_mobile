part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStateStatus.initial,
    this.news,
    this.newsCount = 0,
    this.limit = 10,
    this.offset = 1,
  });

  final NewsStateStatus status;
  final List<NewsItemEntity>? news;
  final int newsCount;
  final int limit;
  final int offset;

  @override
  List<Object?> get props => [
        status,
        news,
        newsCount,
        limit,
        offset,
      ];

  NewsState copyWith({
    NewsStateStatus? status,
    List<NewsItemEntity>? news,
    int? newsCount,
    int? limit,
    int? offset,
  }) =>
      NewsState(
        status: status ?? this.status,
        news: news ?? this.news,
        newsCount: newsCount ?? this.newsCount,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
      );
}

enum NewsStateStatus { initial, loading, error, success }

extension NewsStateStatusX on NewsStateStatus {
  bool get isInitial => this == NewsStateStatus.initial;

  bool get isLoading => this == NewsStateStatus.loading;

  bool get isSuccess => this == NewsStateStatus.success;

  bool get isError => this == NewsStateStatus.error;
}
