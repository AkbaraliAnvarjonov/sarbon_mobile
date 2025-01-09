part of '../search_car_page.dart';

class _SearchEmptyWidget extends StatelessWidget {
  const _SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'empty_sale_car_first'.tr(),
        textAlign: TextAlign.center,
        style: context.textStyle.size15Weight500Black,
      ),
      Text(
        'empty_sale_car_second'.tr(),
        textAlign: TextAlign.center,
        style: context.textStyle.regularFootnote.copyWith(
          color: context.color.greyText,
        ),
      ),
    ],
  );
}
