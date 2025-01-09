import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../constants/icons_constants.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../domain/entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../../../../bloc/route/add_route/add_route_bloc.dart';
import 'widgets/search_address_widget.dart';
import 'widgets/select_date_widget.dart';
import 'widgets/vehicle_types_sheet.dart';

part 'widgets/add_route_item_widget.dart';
part 'widgets/vehicle_types_widget.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({super.key});

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController carryingCapacityController =
      TextEditingController();
  final TextEditingController volumeController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('add_route'.tr()),
        ),
        body: ModalProgressHUD(
          inAsyncCall: context.select(
            (AddRouteBloc bloc) => bloc.state.createRouteStatus.isLoading,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: _AddRouteItemWidget(
              formKey: _formKey,
              carryingCapacityController: carryingCapacityController,
              volumeController: volumeController,
            ),
          ),
        ),
      );
}
