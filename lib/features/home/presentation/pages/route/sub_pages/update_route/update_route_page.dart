import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../domain/entities/routes/fetch_routes_entity.dart';
import '../../../../bloc/route/update_route/update_route_bloc.dart';
import 'widgets/update_route_item_widget.dart';

class UpdateRoutePage extends StatefulWidget {
  const UpdateRoutePage({
    super.key,
    required this.route,
  });

  final RouteEntity route;

  @override
  State<UpdateRoutePage> createState() => _UpdateRoutePageState();
}

class _UpdateRoutePageState extends State<UpdateRoutePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('change_route'.tr()),
        ),
        body: ModalProgressHUD(
          inAsyncCall: context.select(
            (UpdateRouteBloc bloc) =>
                bloc.state.updateRouteStatus.isLoading ||
                bloc.state.getAddressesStatus.isLoading,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: UpdateRouteItemWidget(
              route: widget.route,
            ),
          ),
        ),
      );
}
