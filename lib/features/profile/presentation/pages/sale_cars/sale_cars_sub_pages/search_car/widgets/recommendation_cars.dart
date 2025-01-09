part of '../search_car_page.dart';

class _RecommendationCars extends StatelessWidget {
  const _RecommendationCars({
    required this.recommendationCarsList,
  });

  final List<RecommendationCarsListEntity> recommendationCarsList;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: AppUtils.kPaddingHor16Ver12,
              child: Text(
                'offered_car'.tr(),
                style: context.textStyle.size15Weight500Black.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverList.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  await context.pushNamed(
                    Routes.carSaleDetails,
                    extra: SaleCarsDetailPageArguments(
                      imageUrls: recommendationCarsList[index].imageUrls,
                      carName: recommendationCarsList[index].carName,
                      carPrice: recommendationCarsList[index].carPrice,
                      carDescription:
                          recommendationCarsList[index].carDescription,
                      currency: recommendationCarsList[index].currency,
                      type: recommendationCarsList[index].type,
                      location: recommendationCarsList[index].address,
                      date: recommendationCarsList[index].date,
                      id: recommendationCarsList[index].id,
                      userNumber: recommendationCarsList[index].userNumber,
                      userName: recommendationCarsList[index].userName,
                      userType: '',
                      rating: recommendationCarsList[index].rating,
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
                            imageUrl: recommendationCarsList[index].imageUrls,
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
                              recommendationCarsList[index].carName,
                              style: context.textStyle.size15Weight500Black
                                  .copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppUtils.kGap4,
                            Text(
                              '${recommendationCarsList[index].carPrice.moneyFormat} ${recommendationCarsList[index].currency}',
                              style: context.textStyle.size13Weight600Black
                                  .copyWith(
                                fontSize: 11,
                                color: context.colorScheme.primary,
                              ),
                            ),
                            AppUtils.kGap4,
                            SizedBox(
                              width: context.kSize.width * 0.5,
                              child: Text(
                                recommendationCarsList[index]
                                            .carDescription
                                            .length >
                                        80
                                    ? '${recommendationCarsList[index].carDescription.substring(0, 80)}...'
                                    : recommendationCarsList[index]
                                        .carDescription,
                                style:
                                    context.textStyle.regularCaption2.copyWith(
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
              ),
              itemCount: recommendationCarsList.length,
              separatorBuilder: (context, index) => AppUtils.kGap8,
            ),
          ),
        ],
      );
}
