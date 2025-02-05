import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/core/widgets/loading/modal_progress_hud.dart';
import 'package:sarbon_mobile/services/api_status.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/mixins/location_mixin.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../router/app_routes.dart';
import '../../../../main/presentation/pages/widgets/location_bottom_sheet.dart';
import '../../../data/models/address/address_model.dart';
import '../../bloc/calculator/calculator_bloc.dart';
import 'page_args/calculate_route_page_arguments.dart';
import 'page_args/map_page_arguments.dart';

part 'widgets/from_to_address_widget.dart';

part 'widgets/additional_address_widget.dart';

part 'widgets/add_address_widget.dart';

part '../mixins/calculator_mixin.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> with CalculatorPageMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('calculator'.tr()),
        ),
        body: BlocSelector<CalculatorBloc, CalculatorState, ApiStatus>(
          selector: (state) => state.status,
          builder: (context, status) {
            return ModalProgressHUD(
              inAsyncCall: status.isLoading,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: DecoratedSliver(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: AppUtils.kBorderRadius12,
                      ),
                      sliver: const SliverMainAxisGroup(
                        slivers: [
                          SliverToBoxAdapter(child: _FromToAddressWidget()),
                          _AdditionalAddressWidget(),
                          SliverToBoxAdapter(
                            child: _AddAddressButtonWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: BlocBuilder<CalculatorBloc, CalculatorState>(
            buildWhen: (previous, current) =>
                previous.fromAddress != current.fromAddress ||
                previous.toAddress != current.toAddress ||
                previous.addAdditionalAddresses != current.addAdditionalAddresses,
            builder: (context, state) => ElevatedButton(
              onPressed: state.fromAddress != null && state.toAddress != null
                  ? () async {
                      await _requestRoutes(state: state);
                    }
                  : null,
              child: Text('calculate_route'.tr()),
            ),
          ),
        ),
      );
}
