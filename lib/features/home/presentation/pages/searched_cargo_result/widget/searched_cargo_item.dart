part of '../searched_cargo_result_page.dart';

class SearchedCargoItem extends StatefulWidget {
  const SearchedCargoItem({
    super.key,
    required this.onTap,
    required this.cargoItem,
    required this.onTapShareButton,
  });

  final VoidCallback onTap;
  final VoidCallback onTapShareButton;
  final SearchedCargoItemEntity? cargoItem;

  @override
  State<SearchedCargoItem> createState() => _SearchedCargoItemState();
}

class _SearchedCargoItemState extends State<SearchedCargoItem> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: widget.onTap,
        child: Ink(
          color: context.colorScheme.onPrimary,
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (context.locale.languageCode == 'ru'
                                              ? widget.cargoItem?.cityNameRu
                                              : widget.cargoItem?.cityNameEn) ??
                                          '',
                                      style: context.textStyle.regularHeadline
                                          .copyWith(
                                        color: context.color.textColor,
                                      ),
                                    ),
                                    Text(
                                      (context.locale.languageCode == 'ru'
                                              ? widget.cargoItem
                                                  ?.addressDataEntity?.nameRu
                                              : widget
                                                  .cargoItem
                                                  ?.addressDataEntity
                                                  ?.nameEn) ??
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
                                              ? widget.cargoItem?.city2NameRu
                                              : widget
                                                  .cargoItem?.city2NameEn) ??
                                          '',
                                      style: context.textStyle.regularHeadline
                                          .copyWith(
                                        color: context.color.textColor,
                                      ),
                                    ),
                                    Text(
                                      (context.locale.languageCode == 'ru'
                                              ? widget.cargoItem
                                                  ?.address2DataEntity?.nameRu
                                              : widget
                                                  .cargoItem
                                                  ?.address2DataEntity
                                                  ?.nameEn) ??
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
                          ),
                          AppUtils.kGap4,
                          Text(
                            widget.cargoItem?.distance ?? '',
                            style: context.textStyle.bodyFootnote.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        // IconButton(
                        //   onPressed: widget.onTapShareButton,
                        //   icon: const Icon(Icons.share),
                        //   color: context.color.greyText,
                        // ),
                        IconButton(
                          onPressed: () {
                            if (widget.cargoItem?.isLiked ?? false) {
                              context.read<SearchedCargosBloc>().add(
                                    DeleteLikeCargoEvent(
                                      cargo: widget.cargoItem!,
                                    ),
                                  );
                              widget.cargoItem?.isLiked =
                                  !(widget.cargoItem?.isLiked ?? false);
                            } else {
                              context.read<SearchedCargosBloc>().add(
                                    PushLikeCargoEvent(
                                      cargo: widget.cargoItem!,
                                    ),
                                  );
                              widget.cargoItem?.isLiked =
                                  !(widget.cargoItem?.isLiked ?? false);
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            (widget.cargoItem?.isLiked ?? false)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: (widget.cargoItem?.isLiked ?? false)
                                ? context.colorScheme.error
                                : context.color.greyText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppUtils.kGap4,
                AppUtils.kDivider,
                AppUtils.kGap8,
                CargoItemInfoWidget(
                  type: 'date'.tr(),
                  info: '${widget.cargoItem?.loadTime?.dateMoth()}',
                ),
                // AppUtils.kGap4,
                // CargoItemInfoWidget(
                //   type: 'distance'.tr(),
                //   info:
                //       '570 км', // <-- Get from Yandex map (Mobile side not backend)
                // ),
                AppUtils.kGap4,
                CargoItemInfoWidget(
                  type: 'weight'.tr(),
                  info: '${widget.cargoItem?.weight} т',
                ),
                AppUtils.kGap4,
                CargoItemInfoWidget(
                  type: 'volume'.tr(),
                  info: '${widget.cargoItem?.volumeM3} м3',
                ),
                AppUtils.kGap4,
                Row(
                  children: [
                    RatingBarWidget(
                      rating: (widget.cargoItem?.rating ?? 0).toDouble(),
                    ),
                    // <-- static
                    AppUtils.kGap4,
                    Text(
                      widget.cargoItem?.companyDataEntity?.fullName ?? '',
                      style: context.textStyle.bodyCaption2.copyWith(
                        color: context.color.greyText,
                      ),
                    ),
                  ],
                ),
                AppUtils.kGap16,
                Text(
                  // '31-38 тыс. P',
                  widget.cargoItem?.request ?? false
                      ? 'request'.tr()
                      : '${widget.cargoItem?.bidCash?.toInt().moneyFormat} ${widget.cargoItem?.currencyDataEntity?.code}', // < -- bid_cash
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
