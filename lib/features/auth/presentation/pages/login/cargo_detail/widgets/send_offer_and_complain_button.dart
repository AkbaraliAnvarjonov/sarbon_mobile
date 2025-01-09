part of '../cargo_detail_page.dart';

class _SendOfferAndComplainButton extends StatelessWidget {
  const _SendOfferAndComplainButton();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: AppUtils.kDecorationWithShadow,
        child: BlocBuilder<CargoDetailsBloc, CargoDetailsState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) => SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: state.status.isLoading
                      ? null
                      : () {
                          context.goNamed(Routes.login);
                        },
                  child: Text('send_offer'.tr()),
                ),
                // AppUtils.kGap16,
                // ElevatedButton(
                //   style: ButtonStyle(
                //     foregroundColor: MaterialStateProperty.all<Color>(
                //       context.colorScheme.primary,
                //     ),
                //     backgroundColor: MaterialStateProperty.all<Color>(
                //       context.color.backgroundTabBarColor,
                //     ),
                //   ),
                //   onPressed: state.status.isLoading ? null : () {},
                //   child: Text(
                //     'complain'.tr(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
