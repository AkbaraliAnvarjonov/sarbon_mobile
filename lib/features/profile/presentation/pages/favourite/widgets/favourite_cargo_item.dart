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
  late final bool isYourType;

  @override
  void initState() {
    isYourType = localSource.vehicleId == (widget.cargoItem.vehicleId ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: AppUtils.kPaddingHorizontal16,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius16,
          color: Color(0xFFEDF0F5),
        ),
        child: Padding(
          padding: AppUtils.kPaddingVertical12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppUtils.kPaddingHorizontal12,
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black.withOpacity(0.15)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (widget.cargoItem.companyDataEntity?.photoUrl ?? '').isNotEmpty
                              ? CachedNetworkImageProvider(
                                  widget.cargoItem.companyDataEntity?.photoUrl ?? '',
                                )
                              : const AssetImage(PngImage.absoluteLogo) as ImageProvider,
                        ),
                      ),
                    ),
                    AppUtils.kGap8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ABSOLUTE LOGISTICS',
                              // widget.cargoItem?.fullName ?? 'No name',
                              style: context.textStyle.size14Weight400Black.copyWith(
                                color: const Color(0xFF7E7B86),
                              ),
                            ),
                            AppUtils.kGap4,
                            SvgPicture.asset(SvgImage.verificationIcon),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(SvgImage.starIcon),
                            AppUtils.kGap2,
                            Text(
                              (widget.cargoItem.rating ?? 0).toStringAsFixed(1),
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: const Color(0xFF7E7B86),
                              ),
                            ),
                            AppUtils.kGap2,
                            Text(
                              '(16 отзывов)',
                              style: context.textStyle.regularCaption1.copyWith(
                                color: const Color(0xFF7E7B86),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppUtils.kSpacer,

                    /// share button
                    // GestureDetector(
                    //   onTap: widget.onTapShareButton,
                    //   child: Container(
                    //     height: 35,
                    //     width: 35,
                    //     clipBehavior: Clip.antiAlias,
                    //     decoration: const BoxDecoration(
                    //       color: Color(0xFFE2E4EA),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Center(
                    //       child: SvgPicture.asset(SvgImage.shareIcon),
                    //     ),
                    //   ),
                    // ),
                    AppUtils.kGap8,
                    GestureDetector(
                      onTap: () {
                        widget.cargoItem.isLiked = !(widget.cargoItem.isLiked ?? false);
                        setState(() {});
                        context.read<FavouriteCargoBloc>().add(
                              PutFavouriteCargoEvent(
                                cargo: widget.cargoItem,
                              ),
                            );
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE2E4EA),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            SvgImage.likeIcon,
                            colorFilter: ColorFilter.mode(
                              (widget.cargoItem.isLiked ?? false) ? context.colorScheme.error : const Color(0xFF7E7B86),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap12,
              AppUtils.kDivider,
              AppUtils.kGap12,
              Padding(
                padding: AppUtils.kPaddingHorizontal12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(SvgImage.locationIcon),
                    ),
                    AppUtils.kGap8,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                (((widget.cargoItem.addressFull ?? '').split('|').firstOrNull ?? '').isNotEmpty
                                        ? ((widget.cargoItem.addressFull ?? '').split('|').firstOrNull ?? '')
                                        : (widget.cargoItem.cityName ?? ''))
                                    .split(',')
                                    .first
                                    .cutString(24),
                                style: context.textStyle.buttonStyle.copyWith(
                                  color: const Color(0xFF211F26),
                                ),
                              ),
                              Text(
                                ' - ${widget.cargoItem.countryCodeFrom ?? ''}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: const Color(0xFF7E7B86),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                (widget.cargoItem.asSoonAsA ?? false)
                                    ? 'ready_for_loading'.tr()
                                    : '${widget.cargoItem.loadTime?.dateMoth()}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: const Color(0xFF211F26),
                                ),
                              ),
                            ],
                          ),
                          AppUtils.kGap16,
                          Row(
                            children: [
                              Text(
                                (((widget.cargoItem.addressFull ?? '').split('|').lastOrNull ?? '').isNotEmpty
                                        ? ((widget.cargoItem.addressFull ?? '').split('|').lastOrNull ?? '')
                                        : (widget.cargoItem.city2Name ?? ''))
                                    .split(',')
                                    .first
                                    .cutString(24),
                                style: context.textStyle.regularHeadline.copyWith(
                                  color: context.color.textColor,
                                ),
                              ),
                              Text(
                                ' - ${widget.cargoItem.countryCodeTo ?? ''}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: const Color(0xFF7E7B86),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                (widget.cargoItem.asSoonAsB ?? false)
                                    ? 'as_soon_as_possible'.tr()
                                    : '${widget.cargoItem.date?.dateMoth()}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: const Color(0xFF211F26),
                                ),
                              ),
                              Text(
                                ' ~ ${widget.cargoItem.distance}',
                                style: context.textStyle.size14Weight400Black.copyWith(
                                  color: const Color(0xFF7E7B86),
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
              AppUtils.kGap16,
              Padding(
                padding: AppUtils.kPaddingHorizontal12,
                child: Material(
                  borderRadius: AppUtils.kBorderRadius12,
                  color: context.colorScheme.onPrimary,
                  child: Padding(
                    padding: AppUtils.kPaddingAll12,
                    child: Column(
                      children: [
                        if (isYourType)
                          Row(
                            children: [
                              if (isYourType)
                                SvgPicture.asset(SvgImage.truckGreenIcon)
                              else
                                SvgPicture.asset(SvgImage.truckIcon),
                              AppUtils.kGap4,
                              Expanded(
                                child: Text(
                                  isYourType
                                      ? 'Ваша машина подходит для данного груза'
                                      : 'Ваша машина не подходит для данного груза',
                                  style: context.textStyle.size14Weight400Black.copyWith(
                                    color: isYourType ? const Color(0xFF15BA4D) : const Color(0xFF7E7B86),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isYourType) AppUtils.kGap8,
                        Row(
                          children: [
                            Text(
                              widget.cargoItem.cardoTypeName ?? '',
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: const Color(0xFF211F26),
                              ),
                            ),
                            AppUtils.kSpacer,
                            SizedBox(
                              width: 70,
                              child: Row(
                                children: [
                                  SvgPicture.asset(SvgImage.dumbellIcon),
                                  AppUtils.kGap6,
                                  Text(
                                    '${widget.cargoItem.weight}т',
                                    style: context.textStyle.size14Weight500Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppUtils.kGap2,
                        Row(
                          children: [
                            Text(
                              widget.cargoItem.vehicleTypeName ?? '',
                              style: context.textStyle.size14Weight500Black.copyWith(
                                color: const Color(0xFF7E7B86),
                              ),
                            ),
                            AppUtils.kSpacer,
                            SizedBox(
                              width: 70,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    SvgImage.kubIcon,
                                    colorFilter: const ColorFilter.mode(
                                      Color(0xFF7E7B86),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  AppUtils.kGap6,
                                  Text(
                                    '${widget.cargoItem.volumeM3 == 0 ? '-- ' : widget.cargoItem?.volumeM3}m3',
                                    style: context.textStyle.size14Weight500Black.copyWith(
                                      color: const Color(0xFF7E7B86),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppUtils.kGap16,
              Padding(
                padding: AppUtils.kPaddingHorizontal12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'total_price'.tr(),
                          style: context.textStyle.size14Weight400Black.copyWith(
                            color: const Color(0xFF7E7B86),
                          ),
                        ),
                        Text(
                          widget.cargoItem.request ?? false
                              ? 'request'.tr()
                              : widget.cargoItem.bidCash?.toInt() == 0
                                  ? 'Договорная'
                                  : '${widget.cargoItem.bidCash?.toInt()} ${widget.cargoItem.currencyDataEntity?.code}',
                          // < -- bid_cash
                          style: context.textStyle.regularHeadline.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'prepayment'.tr(),
                          style: context.textStyle.size14Weight400Black.copyWith(
                            color: const Color(0xFF7E7B86),
                          ),
                        ),
                        Text(
                          widget.cargoItem.currencyPersentage == 0
                              ? 'Нет'
                              : '${widget.cargoItem.currencyPersentage} ${widget.cargoItem.currencyDataEntity?.code ?? ''}',
                          style: context.textStyle.size14Weight500Black.copyWith(
                            color: const Color(0xFF211F26),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'payment_type'.tr(),
                          style: context.textStyle.size14Weight400Black.copyWith(
                            color: const Color(0xFF7E7B86),
                          ),
                        ),
                        Text(
                          'Наличные',
                          style: context.textStyle.size14Weight500Black.copyWith(
                            color: const Color(0xFF211F26),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppUtils.kGap12,
              Padding(
                padding: AppUtils.kPaddingHorizontal12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppUtils.kBorderRadius12,
                    ),
                  ),
                  onPressed: widget.onTap,
                  child: Text(
                    'cargo_details'.tr(),
                    style: context.textStyle.size14Weight500Black.copyWith(
                      color: context.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
