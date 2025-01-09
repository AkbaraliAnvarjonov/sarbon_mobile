part of '../search_car_page.dart';

class _FoundFromSearchItem extends StatelessWidget {
  const _FoundFromSearchItem({
    required this.searchResultList,
  });

  final SaleCarsSearchResultListEntity searchResultList;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          await context.pushNamed(
            Routes.carSaleDetails,
            extra: SaleCarsDetailPageArguments(
              imageUrls: searchResultList.imageUrls,
              carName: searchResultList.carName,
              carPrice: searchResultList.carPrice,
              carDescription: searchResultList.carDescription,
              currency: searchResultList.currency,
              type: searchResultList.type,
              location: searchResultList.address,
              date: searchResultList.date,
              id: searchResultList.id,
              userNumber: searchResultList.userNumber,
              userName: searchResultList.userName,
              userType: '',
              rating: searchResultList.rating,
            ),
          );
        },
        child: Material(
          color: context.colorScheme.surface,
          borderRadius: AppUtils.kBorderRadius8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: searchResultList.imageUrls,
                  width: context.kSize.width,
                  height: 182,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: context.color.greyText,
                  ),
                ),
              ),
              Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searchResultList.carName,
                          style: context.textStyle.splashTitle.copyWith(
                            fontSize: 17,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '${searchResultList.carPrice} ${searchResultList.currency}',
                          style: context.textStyle.splashTitle.copyWith(
                            fontSize: 15,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    AppUtils.kGap16,
                    AppUtils.kDivider,
                    AppUtils.kGap8,
                    Row(
                      children: [
                        Text(
                          '${'type_vehicle'.tr()}: ',
                          style: context.textStyle.regularCaption1.copyWith(
                            color: context.color.lightGray,
                          ),
                        ),
                        AppUtils.kGap8,
                        Text(
                          searchResultList.type,
                          style: context.textStyle.regularCaption1.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        AppUtils.kSpacer,
                        Column(
                          children: [
                            Text(
                              searchResultList.address,
                              style: context.textStyle.regularCaption1.copyWith(
                                color: context.color.yellow,
                              ),
                            ),
                            AppUtils.kGap8,
                            Text(
                              '${searchResultList.date.date()} ${searchResultList.date.timeParseHourMinute()}',
                              style: context.textStyle.regularCaption1.copyWith(
                                color: context.color.greyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppUtils.kGap8,
                    AppUtils.kDivider,
                    AppUtils.kGap16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.kSize.width * 0.5,
                          child: Text(
                            searchResultList.userName,
                            style: context.textStyle.regularCaption1.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                        Text(
                          searchResultList.userNumber,
                          style: context.textStyle.regularCaption1.copyWith(
                            color: context.color.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
