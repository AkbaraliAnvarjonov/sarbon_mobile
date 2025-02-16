import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/features/orders/presentation/pages/order_detail/widgets/good_feedback.dart';

import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/rating/rating_bar_widget.dart';
import '../../../bloc/order_detail/order_details_bloc.dart';
import 'bad_feedback_widget.dart';

class GiveFeedbackAndRatingDetailPageWidget extends StatefulWidget {
  const GiveFeedbackAndRatingDetailPageWidget({
    super.key,
    required this.state,
  });

  final OrderDetailsState state;

  @override
  State<GiveFeedbackAndRatingDetailPageWidget> createState() => _GiveFeedbackAndRatingDetailPageWidgetState();
}

class _GiveFeedbackAndRatingDetailPageWidgetState extends State<GiveFeedbackAndRatingDetailPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        body: BlocConsumer<OrderDetailsBloc, OrderDetailsState>(
          listenWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
          listener: (context, state) {
            if (state.orderDetailStatus.isSuccess) {
              context.pop(true);
            }
          },
          builder: (context, state) => CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            slivers: [
              SliverSafeArea(
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverList.list(
                      children: [
                        Container(
                          color: const Color(0xFFF6F7F8),
                          height: 70,
                          padding: AppUtils.kPaddingHor24Ver20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'rate_the_customer'.tr(),
                                style: context.textStyle.appBarTitle,
                              ),
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0xFF49454F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppUtils.kGap16,
                        Center(
                          child: RatingBarWidget(
                            onRatingChanged: (value) {
                              context.read<OrderDetailsBloc>().add(
                                    GiveRatingEvent(rating: value),
                                  );
                            },
                            rating: state.rating,
                            iconsSize: 56,
                            activeRatingColor: context.color.yellow,
                          ),
                        ),
                        Padding(
                          padding: AppUtils.kPaddingAll20,
                          child: state.rating > 3 || state.rating == 0
                              ? const GoodFeedbackWidget()
                              : const BadFeedBackWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
            child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
              buildWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
              builder: (context, state) => ElevatedButton(
                onPressed: () {
                  context.read<OrderDetailsBloc>().add(const PostRatingReviewsEvent());
                },
                child: state.orderDetailStatus.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const Text('Готово'),
              ),
            ),
          ),
        ),
      );
}
