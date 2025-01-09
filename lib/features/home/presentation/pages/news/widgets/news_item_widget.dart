part of '../news_page.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.newsItem,
  });

  final NewsItemEntity? newsItem;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.colorScheme.onPrimary,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: AppUtils.kBorderRadiusTop12,
              child: CachedNetworkImage(
                imageUrl: (newsItem?.photo.isEmpty ?? false) ||
                        (newsItem?.photo == null)
                    ? 'https://cdn.dribbble.com/users/2682445/screenshots/6338168/radius_logo.jpg?compress=1&resize=400x300&vertical=top'
                    : newsItem?.photo ?? '',
                fit: BoxFit.cover,
                height: 164,
                width: context.kSize.width,
              ),
            ),
            AppUtils.kGap16,
            Padding(
              padding: AppUtils.kPaddingAll12,
              child: Text(
                newsItem?.title ?? '',
                style: context.textStyle.appBarTitle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
            AppUtils.kGap4,
            Padding(
              padding: AppUtils.kPaddingAll12,
              child: HtmlWidget(
                newsItem?.comment ?? '',
                textStyle: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.middleGray,
                ),
              ),
            ),
            AppUtils.kGap16,
            Padding(
              padding: AppUtils.kPaddingAll12,
              child: Text(
                newsItem?.date ?? '',
                style: context.textStyle.regularSubheadline.copyWith(
                  color: context.color.middleGray,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
}
