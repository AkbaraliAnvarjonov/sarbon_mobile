part of '../home_page.dart';

class NewsTitleWidget extends StatelessWidget {
  const NewsTitleWidget({
    super.key,
    required this.newsCount,
    required this.news,
  });

  final int newsCount;
  final List<NewsItemEntity> news;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingLR16T0B12,
        child: GestureDetector(
          onTap: () async {
            unawaited(
              context.pushNamed(
                Routes.news,
                extra: NewsPageArguments(
                  news: news,
                  newsCount: newsCount,
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'news'.tr(),
                style: context.textStyle.appBarTitle,
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   size: 18,
              //   color: context.color.greyText,
              // ),
            ],
          ),
        ),
      );
}
