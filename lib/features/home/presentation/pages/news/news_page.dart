import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_cached_image/custom_cached_network_image.dart';
import '../../../domain/entities/news/get_news_response_entity.dart';
import '../../args/news_page_arguments.dart';
import '../../bloc/news/news_bloc.dart';

part 'widgets/news_item_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    super.key,
    required this.args,
  });

  final NewsPageArguments args;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<NewsBloc>().add(
          GetNewsListFromArgument(
            count: widget.args.newsCount ?? 0,
            news: widget.args.news ?? [],
          ),
        );
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if ((_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) &&
        !(widget.args.isFromSingle ?? false)) {
      context.read<NewsBloc>().add(
            const GetNewsWithPaginationEvent(),
          );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          title: Text(
            'news'.tr(),
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          buildWhen: (previous, current) =>
              previous.news != current.news ||
              previous.status != current.status,
          builder: (context, state) => Padding(
            padding: AppUtils.kPaddingAll16,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverList.separated(
                  itemBuilder: (_, index) => NewsItemWidget(
                    newsItem: state.news?[index],
                  ),
                  separatorBuilder: (_, index) => AppUtils.kGap16,
                  itemCount: state.news?.length ?? 0,
                ),
                SliverToBoxAdapter(
                  child: SafeArea(
                    top: false,
                    minimum: AppUtils.kPaddingAll16,
                    child: state.status.isLoading
                        ? const CupertinoActivityIndicator(radius: 12)
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
