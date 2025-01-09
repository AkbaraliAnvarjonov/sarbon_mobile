import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/debaouncer/debouncer.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';
import '../../../domain/entities/news/get_news_response_entity.dart';
import '../../args/news_page_arguments.dart';
import '../../bloc/home_bloc.dart';

part '../mixin/news_widget_mixin.dart';

part 'news_item.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
    required this.newsCount,
    required this.news,
  });

  final int newsCount;
  final List<NewsItemEntity> news;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> with NewsMixin {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: context.kSize.height <= 800 ? context.kSize.height * 0.28 : context.kSize.height * 0.24,
        child: ListView.separated(
          controller: scrollController,
          padding: AppUtils.kPaddingHorizontal16,
          addRepaintBoundaries: false,
          addAutomaticKeepAlives: false,
          itemCount: widget.news.length + 1,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index > widget.news.length - 1) {
              if (homeBloc.state.status.isPaginationLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return const SizedBox();
            }
            return NewsItem(
              onTap: () {
                unawaited(
                  context.pushNamed(
                    Routes.news,
                    extra: NewsPageArguments(
                      isFromSingle: true,
                      news: [widget.news[index]],
                      newsCount: widget.newsCount,
                    ),
                  ),
                );
              },
              imageUrl: widget.news[index].photo,
              title: widget.news[index].title,
              content: widget.news[index].comment,
              date: widget.news[index].date,
            );
          },
          separatorBuilder: (_, __) => AppUtils.kGap12,
        ),
      );
}
