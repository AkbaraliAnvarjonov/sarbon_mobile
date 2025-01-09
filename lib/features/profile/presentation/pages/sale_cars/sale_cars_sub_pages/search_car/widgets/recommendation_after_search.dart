part of '../search_car_page.dart';

class _RecommendationAfterSearch extends StatelessWidget {
  const _RecommendationAfterSearch({
    required this.recommendationCarsList,
  });

  final RecommendationCarsListEntity recommendationCarsList;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          await context.pushNamed(
            Routes.carSaleDetails,
            extra: SaleCarsDetailPageArguments(
              imageUrls: recommendationCarsList.imageUrls,
              carName: recommendationCarsList.carName,
              carPrice: recommendationCarsList.carPrice,
              carDescription: recommendationCarsList.carDescription,
              currency: recommendationCarsList.currency,
              type: recommendationCarsList.type,
              location: recommendationCarsList.address,
              date: recommendationCarsList.date,
              id: recommendationCarsList.id,
              userNumber: recommendationCarsList.userNumber,
              userName: recommendationCarsList.userName,
              userType: '',
              rating: recommendationCarsList.rating,
            ),
          );
        },
        child: Material(
          color: context.colorScheme.surface,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: AppUtils.kBorderRadius8,
                  child: CachedNetworkImage(
                    imageUrl: recommendationCarsList.imageUrls,
                    width: 137,
                    height: 87,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: context.color.greyText,
                    ),
                  ),
                ),
                AppUtils.kGap16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      recommendationCarsList.carName,
                      style: context.textStyle.size15Weight500Black.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppUtils.kGap4,
                    Text(
                      '${recommendationCarsList.carPrice} ${recommendationCarsList.currency}',
                      style: context.textStyle.size13Weight600Black.copyWith(
                        fontSize: 11,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    AppUtils.kGap4,
                    SizedBox(
                      width: context.kSize.width * 0.5,
                      child: Text(
                        recommendationCarsList.carDescription.length > 80
                            ? '${recommendationCarsList.carDescription.substring(0, 80)}...'
                            : recommendationCarsList.carDescription,
                        style: context.textStyle.regularCaption2.copyWith(
                          color: context.color.greyText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
