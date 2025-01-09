part of '../order_detail_page.dart';

class _OrderForDealButton extends StatelessWidget {
  const _OrderForDealButton();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (!state.orderDetailStatus.isLoading &&
                          (state.details?.statuses?.firstOrNull ?? '') == 'active' &&
                          ((state.details?.provisions?.contains('new_proposal_from_director') ?? false) ||
                              (state.details?.provisions?.contains('approve_from_driver') ?? false)))
                      ? () async {
                          if (state.details?.acceptedOffers == 0) {
                            AppUtils.showSnackBar(context, 'Эта груз неактивно');
                          } else {
                            context.pop(true);
                          }
                        }
                      : null,
                  child: Text('accept'.tr()),
                ),
                AppUtils.kGap16,
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      context.colorScheme.primary,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.color.backgroundTabBarColor,
                    ),
                  ),
                  onPressed: state.orderDetailStatus.isLoading
                      ? null
                      : () {
                          context.pop(false);
                        },
                  child: Text(
                    'refuse'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
