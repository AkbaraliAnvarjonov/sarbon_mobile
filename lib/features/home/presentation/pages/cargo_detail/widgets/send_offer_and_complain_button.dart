part of '../cargo_detail_page.dart';

class _SendOfferAndComplainButton extends StatefulWidget {
  const _SendOfferAndComplainButton();

  @override
  State<_SendOfferAndComplainButton> createState() => _SendOfferAndComplainButtonState();
}

class _SendOfferAndComplainButtonState extends State<_SendOfferAndComplainButton> {
  @override
  Widget build(BuildContext context) => BlocBuilder<CargoDetailsBloc, CargoDetailsState>(
        buildWhen: (previous, current) =>
            previous.status != current.status || previous.signedOrdersStatus != current.signedOrdersStatus,
        builder: (context, state) => Padding(
          padding: AppUtils.kPaddingHorizontal16,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 46,
                  child: ElevatedButton(
                    onPressed: state.status.isLoading || state.signedOrdersStatus.isLoading
                        ? null
                        : () async {
                            if (localSource.userId.isEmpty) {
                              await customModalBottomSheet<void>(
                                context: context,
                                maxHeight: 410,
                                minHeight: 380,
                                builder: (_, controller) => const AuthBottomSheet(),
                              );
                            } else if (state.finishedOrdersCount == 0) {
                              await context
                                  .pushNamed(
                                Routes.oppositeOffer,
                                extra: OppositeOfferPageArguments(
                                  firmId2: state.details?.firmId ?? '',
                                  cargoGuid: state.details?.guid ?? '',
                                  noHaggling: state.details?.noHaggling ?? false,
                                  usersId2: state.details?.usersId ?? '',
                                  currency: state.details?.bidCash?.toString() ?? '',
                                ),
                              )
                                  .then(
                                (value) {
                                  if (value != null && value == true) {
                                    if (!context.mounted) return;
                                    context.pop(true);
                                  }
                                },
                              );
                            } else {
                              await customModalBottomSheet<void>(
                                context: context,
                                builder: (_, controller) => const AlreadyOrderBottomSheet(),
                              );
                            }
                          },
                    child: Text(
                      'send_offer'.tr(),
                      style: context.textStyle.size14Weight500Black.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              AppUtils.kGap24,
              GestureDetector(
                onTap: () async {
                  await Share.share(
                    '''${Constants.deepLink}${state.details?.guid ?? ''}\n${state.details?.cityName ?? ''} - ${state.details?.city2Name ?? ''}; ${state.details?.cargoTypeDetailsData?.name ?? ''} (${'cargo'.tr()})\n${state.details?.vehicleDataEntity?.name ?? ''} (${'vehicle_view'.tr()})''',
                    subject: 'share_cargo'.tr(),
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
                    child: SvgPicture.asset(SvgImage.shareIcon),
                  ),
                ),
              ),
              AppUtils.kGap8,
              if (localSource.userId.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    if (state.details?.isLiked ?? false) {
                      context.read<CargoDetailsBloc>().add(
                            DeleteLikeCargoEvent(
                              cargoId: state.details?.guid ?? '',
                            ),
                          );
                    } else {
                      context.read<CargoDetailsBloc>().add(
                            PushLikeCargoEvent(
                              cargoId: state.details?.guid ?? '',
                            ),
                          );
                    }
                    setState(() {});
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
                          (state.details?.isLiked ?? false) ? context.colorScheme.error : const Color(0xFF7E7B86),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
