import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/inputs/check_box_widget.dart';
import '../../../bloc/order_detail/order_details_bloc.dart';

class GoodFeedbackWidget extends StatelessWidget {
  const GoodFeedbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
      buildWhen: (p, c) => p.ratingReviews != c.ratingReviews,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'what_did_you_like_most'.tr(),
              style: context.textStyle.regularHeadline,
            ),
            AppUtils.kGap24,
            CheckBoxWidgetRight(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(
                        key: 'everything_went_according_to_plan',
                      ),
                    );
              },
              title: 'everything_went_according_to_plan'.tr(),
              value: state.ratingReviews.contains('everything_went_according_to_plan'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetRight(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'payment_made_on_time'),
                    );
              },
              title: 'payment_made_on_time'.tr(),
              value: state.ratingReviews.contains('payment_made_on_time'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetRight(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'the_cargo_informatio_was_accurate'),
                    );
              },
              title: 'the_cargo_informatio_was_accurate'.tr(),
              value: state.ratingReviews.contains('the_cargo_informatio_was_accurate'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetRight(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'responsible_customer'),
                    );
              },
              title: 'responsible_customer'.tr(),
              value: state.ratingReviews.contains('responsible_customer'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetRight(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'i_would_work_with_this_client_again'),
                    );
              },
              title: 'i_would_work_with_this_client_again'.tr(),
              value: state.ratingReviews.contains('i_would_work_with_this_client_again'),
            ),
          ],
        );
      },
    );
  }
}
