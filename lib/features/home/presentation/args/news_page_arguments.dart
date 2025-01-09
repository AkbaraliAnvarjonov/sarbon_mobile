import '../../domain/entities/news/get_news_response_entity.dart';

class NewsPageArguments {
  const NewsPageArguments({
    this.news,
    this.newsCount,
    this.isFromSingle = false,
  });

  final bool? isFromSingle;
  final int? newsCount;
  final List<NewsItemEntity>? news;
}
