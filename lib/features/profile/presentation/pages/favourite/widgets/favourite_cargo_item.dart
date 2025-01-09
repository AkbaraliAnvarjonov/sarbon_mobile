part of '../favourite_page.dart';

class _FavouriteCargoItem extends StatefulWidget {
  const _FavouriteCargoItem({
    required this.onTap,
    required this.cargoItem,
  });

  final VoidCallback onTap;
  final FavouriteCargoListEntity cargoItem;

  @override
  State<_FavouriteCargoItem> createState() => _SearchedCargoItemState();
}

class _SearchedCargoItemState extends State<_FavouriteCargoItem> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onTap,
        child: Ink(
          color: context.colorScheme.onPrimary,
          child: Padding(
            padding: AppUtils.kPaddingHor16Ver12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (context.locale.languageCode == 'ru'
                                          ? widget.cargoItem.cityNameRu
                                          : widget.cargoItem.cityNameEn) ??
                                      '',
                                  style: context.textStyle.regularHeadline
                                      .copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                Text(
                                  (context.locale.languageCode == 'ru'
                                          ? widget.cargoItem.fromAddressRu
                                          : widget.cargoItem.fromAddressEn) ??
                                      '',
                                  style: context.textStyle.regularFootnote
                                      .copyWith(
                                    color: context.color.gray700,
                                  ),
                                ),
                              ],
                            ),
                            AppUtils.kGap8,
                            SvgPicture.asset(
                              SvgImage.icArrowRight,
                            ),
                            AppUtils.kGap8,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (context.locale.languageCode == 'ru'
                                          ? widget.cargoItem.city2NameRu
                                          : widget.cargoItem.city2NameEn) ??
                                      '',
                                  style: context.textStyle.regularHeadline
                                      .copyWith(
                                    color: context.color.textColor,
                                  ),
                                ),
                                Text(
                                  (context.locale.languageCode == 'ru'
                                          ? widget.cargoItem.toAddressRu
                                          : widget.cargoItem.toAddressEn) ??
                                      '',
                                  style: context.textStyle.regularFootnote
                                      .copyWith(
                                    color: context.color.gray700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        AppUtils.kGap4,
                        Text(
                          widget.cargoItem.distance ?? '',
                          style: context.textStyle.bodyFootnote.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        widget.cargoItem.isLiked =
                            !(widget.cargoItem.isLiked ?? false);
                        setState(() {});
                        context.read<FavouriteCargoBloc>().add(
                              PutFavouriteCargoEvent(
                                cargo: widget.cargoItem,
                              ),
                            );
                      },
                      icon: Icon(
                        (widget.cargoItem.isLiked ?? false)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: (widget.cargoItem.isLiked ?? false)
                            ? context.colorScheme.error
                            : context.color.greyText,
                      ),
                    ),
                  ],
                ),
                AppUtils.kGap4,
                AppUtils.kDivider,
                AppUtils.kGap8,
                _FavouriteItemInfoWidget(
                  type: 'date'.tr(),
                  info: widget.cargoItem.date?.dateMoth() ?? '',
                ),
                // AppUtils.kGap4,
                // _FavouriteItemInfoWidget(
                //   type: 'distance'.tr(),
                //   info: '570 км',
                // ),
                AppUtils.kGap4,
                _FavouriteItemInfoWidget(
                  type: 'weight'.tr(),
                  info: '${widget.cargoItem.weight} т',
                ),
                AppUtils.kGap4,
                _FavouriteItemInfoWidget(
                  type: 'volume'.tr(),
                  info: '${widget.cargoItem.volume} м3',
                ),
                AppUtils.kGap4,
                Row(
                  children: [
                    RatingBarWidget(
                      rating: (widget.cargoItem.rating ?? 0).toDouble(),
                    ),
                    // <-- static
                    AppUtils.kGap4,
                    Text(
                      widget.cargoItem.companyName ?? '',
                      style: context.textStyle.bodyCaption2.copyWith(
                        color: context.color.greyText,
                      ),
                    ),
                  ],
                ),
                AppUtils.kGap16,
                Text(
                  // '31-38 тыс. P',
                  '${widget.cargoItem.price} ${widget.cargoItem.currency}',
                  // < -- bid_cash
                  style: context.textStyle.regularHeadline.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
