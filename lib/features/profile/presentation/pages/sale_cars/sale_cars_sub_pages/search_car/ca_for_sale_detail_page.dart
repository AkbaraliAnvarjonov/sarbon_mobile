import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../constants/icons_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/custom_cached_image/custom_cached_network_image.dart';
import '../../../pages_arguments/sale_cars_detail_page_argument.dart';

part 'widgets/detail_page_address_date_widget.dart';

part 'widgets/detail_page_car_info_widget.dart';

part 'widgets/detail_page_description_widget.dart';

part 'widgets/detail_page_user_info_widget.dart';

part 'widgets/detail_page_call_button_widget.dart';

class CarForSaleDetailPage extends StatelessWidget {
  const CarForSaleDetailPage({
    super.key,
    required this.saleCarDetail,
  });

  final SaleCarsDetailPageArguments saleCarDetail;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          title: Text(saleCarDetail.carName),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // _AddressAndDateViewWidget(
                    //   carPrice: saleCarDetail.carPrice,
                    //   currency: saleCarDetail.currency,
                    //   date: saleCarDetail.date,
                    // ),
                    _CarInfoViewWidget(saleCarDetail: saleCarDetail),
                    _DescriptionViewWidget(
                      carDescription: saleCarDetail.carDescription,
                    ),
                    // _UserInfoViewWidget(saleCarDetail: saleCarDetail),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _CarPriceAndCallButtonViewWidget(
          saleCarDetail: saleCarDetail,
        ),
      );
}
