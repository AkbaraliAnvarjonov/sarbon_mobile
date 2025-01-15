import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarbon_mobile/core/extension/extension.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/inputs/check_box_left_widget.dart';
import '../../../bloc/order_detail/order_details_bloc.dart';

class BadFeedBackWidget extends StatelessWidget {
  const BadFeedBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
      buildWhen: (p, c) => p.ratingReviews != c.ratingReviews || p.complaintString != c.complaintString,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'what_were_you_dissatisfied_with'.tr(),
              style: context.textStyle.regularHeadline,
            ),
            AppUtils.kGap24,
            CheckBoxWidgetLeft(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(
                        key: 'payment_problems_occurred',
                      ),
                    );
              },
              title: 'payment_problems_occurred'.tr(),
              value: state.ratingReviews.contains('payment_problems_occurred'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetLeft(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'loading_unloading_delay'),
                    );
              },
              title: 'loading_unloading_delay'.tr(),
              value: state.ratingReviews.contains('loading_unloading_delay'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetLeft(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'incorrect_cargo_information'),
                    );
              },
              title: 'incorrect_cargo_information'.tr(),
              value: state.ratingReviews.contains('incorrect_cargo_information'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetLeft(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'unsatisfactory_cargo_condition'),
                    );
              },
              title: 'unsatisfactory_cargo_condition'.tr(),
              value: state.ratingReviews.contains('unsatisfactory_cargo_condition'),
            ),
            AppUtils.kDivider,
            CheckBoxWidgetLeft(
              onTap: () {
                context.read<OrderDetailsBloc>().add(
                      const SelectRatingCauseItemsEvent(key: 'customer_was_unavailable_for_contact'),
                    );
              },
              title: 'customer_was_unavailable_for_contact'.tr(),
              value: state.ratingReviews.contains('customer_was_unavailable_for_contact'),
            ),
          ],
        );
      },
    );
  }
}
