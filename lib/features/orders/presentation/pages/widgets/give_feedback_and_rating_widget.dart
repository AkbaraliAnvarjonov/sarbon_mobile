part of 'signed_orders_tab_item.dart';

class _GiveFeedbackAndRatingWidget extends StatefulWidget {
  const _GiveFeedbackAndRatingWidget();

  @override
  State<_GiveFeedbackAndRatingWidget> createState() => _GiveFeedbackAndRatingWidgetState();
}

class _GiveFeedbackAndRatingWidgetState extends State<_GiveFeedbackAndRatingWidget> {
  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        body: BlocListener<OrdersBloc, OrdersState>(
          listenWhen: (previous, current) => previous.orderStatusAndRatingStatus != current.orderStatusAndRatingStatus,
          listener: (context, state) {
            if (state.orderStatusAndRatingStatus.isSuccess) {
              context.pop(true);
            }
          },
          child: BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) => CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              shrinkWrap: true,
              slivers: [
                SliverSafeArea(
                  minimum: AppUtils.kPaddingAll16,
                  sliver: SliverMainAxisGroup(
                    slivers: [
                      SliverList.list(
                        children: [
                          Text(
                            'rate_the_customer'.tr(),
                            style: context.textStyle.appBarTitle,
                          ),
                          AppUtils.kGap16,
                          Center(
                            child: RatingBarWidget(
                              onRatingChanged: (value) {
                                context.read<OrdersBloc>().add(
                                      GiveRatingEvent(rating: value),
                                    );
                              },
                              rating: state.rating,
                              iconsSize: 56,
                              activeRatingColor: context.color.yellow,
                            ),
                          ),
                          AppUtils.kGap32,
                          Text(
                            'what_did_you_like_most'.tr(),
                            style: context.textStyle.regularHeadline,
                          ),
                          AppUtils.kGap24,
                          CheckBoxWidgetRight(
                            onTap: () {
                              context.read<OrdersBloc>().add(
                                    SelectRatingCauseItemsEvent(
                                      index: 0,
                                      status: !state.goodClient.values.first,
                                    ),
                                  );
                            },
                            title: 'good_customer'.tr(),
                            value: state.goodClient.values.first,
                          ),
                          AppUtils.kDivider,
                          CheckBoxWidgetRight(
                            onTap: () {
                              context.read<OrdersBloc>().add(
                                    SelectRatingCauseItemsEvent(
                                      index: 1,
                                      status: !state.paymentOnTime.values.first,
                                    ),
                                  );
                            },
                            title: 'received_money_on_time'.tr(),
                            value: state.paymentOnTime.values.first,
                          ),
                          AppUtils.kDivider,
                          CheckBoxWidgetRight(
                            onTap: () {
                              context.read<OrdersBloc>().add(
                                    SelectRatingCauseItemsEvent(
                                      index: 2,
                                      status: !state.clientDidNotPay.values.first,
                                    ),
                                  );
                            },
                            title: 'clean'.tr(),
                            value: state.clientDidNotPay.values.first,
                          ),
                          // AppUtils.kDivider,
                          // CheckBoxWidget(
                          //   onTap: () {},
                          //   title: 'Приятная музыка',
                          // ),
                          // AppUtils.kDivider,
                          // CheckBoxWidget(
                          //   onTap: () {},
                          //   title: 'Вежливый',
                          //   value: true,
                          // ),
                          // AppUtils.kDivider,
                          // CheckBoxWidget(
                          //   onTap: () {},
                          //   title: 'Хорошее настроение',
                          // ),
                          AppUtils.kGap16,
                          Text(
                            'comment'.tr(),
                            style: context.textStyle.regularHeadline.copyWith(
                              color: context.color.textColor,
                            ),
                          ),
                          AppUtils.kGap8,
                          Ink(
                            decoration: BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius12,
                              color: context.colorScheme.onPrimary,
                            ),
                            child: CustomTextField(
                              onFieldSubmitted: (value) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              showEnabledBorder: true,
                              controller: commentController,
                              contentPadding: AppUtils.kPaddingAll8,
                              fillColor: context.colorScheme.onPrimary,
                              hintText: 'enter_comment'.tr(),
                              hintTextStyle: context.textStyle.regularSubheadline.copyWith(
                                color: context.color.midGray,
                              ),
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
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 0),
                blurRadius: 14,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ],
          ),
          child: SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: BlocBuilder<OrdersBloc, OrdersState>(
              buildWhen: (previous, current) =>
                  previous.orderStatusAndRatingStatus != current.orderStatusAndRatingStatus,
              builder: (context, state) => ElevatedButton(
                onPressed: () {
                  context.read<OrdersBloc>().add(
                        PostRatingReviewsEvent(
                          comment: commentController.text.trim(),
                          companyId: state.finishedOrders[state.onTapedIndex].companyId ?? '',
                          usersId3: state.finishedOrders[state.onTapedIndex].userId3 ?? '',
                        ),
                      );
                },
                child: state.orderStatusAndRatingStatus.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Text('ready'.tr()),
              ),
            ),
          ),
        ),
      );
}
