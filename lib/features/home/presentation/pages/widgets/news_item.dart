part of 'news_widget.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    this.onTap,
    this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
  });

  final VoidCallback? onTap;
  final String? imageUrl;
  final String title;
  final String content;
  final String date;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius12,
        child: Ink(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: context.colorScheme.onPrimary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppUtils.kBorderRadiusTop12,
                child: CachedNetworkImage(
                  imageUrl: imageUrl?.isEmpty ?? false || imageUrl == null
                      ? 'https://cdn.dribbble.com/users/2682445/screenshots/6338168/radius_logo.jpg?compress=1&resize=400x300&vertical=top'
                      : imageUrl ?? '',
                  fit: BoxFit.cover,
                  height: 130,
                  width: 200,
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: AppUtils.kPaddingHor8Ver4,
                child: Text(
                  date.dateTime2(),
                  style: context.textStyle.size9Weight400Black,
                ),
              ),
              Padding(
                padding: AppUtils.kPaddingHorizontal8,
                child: Text(
                  title.length > 18 ? '${title.substring(0, 18)}...' : title,
                  style: context.textStyle.bodyCaption1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppUtils.kGap4,
              Padding(
                padding: AppUtils.kPaddingHorizontal8,
                child: HtmlWidget(
                  content.length > 25
                      ? '${content.substring(0, 25)}...'
                      : content,
                  textStyle: context.textStyle.regularCaption2.copyWith(
                    color: context.color.middleGray,
                  ),
                ),
                //     Text(
                //   content,
                //   style: context.textStyle.regularCaption2.copyWith(
                //     color: context.color.middleGray,
                //   ),
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ),
              AppUtils.kGap8,
            ],
          ),
        ),
      );
}
