import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarbon_mobile/features/home/presentation/pages/widgets/select_widget.dart';

import '../../../../../core/extension/extension.dart';

import '../../../../../core/utils/utils.dart';
import '../../bloc/home_bloc.dart';

class SelectVehicleBottomSheet extends StatefulWidget {
  const SelectVehicleBottomSheet({
    super.key,
    required this.isForInitialPointOfAddress,
    this.scrollController,
  });

  final bool isForInitialPointOfAddress;
  final ScrollController? scrollController;

  @override
  State<SelectVehicleBottomSheet> createState() => _SelectVehicleBottomSheetState();
}

class _SelectVehicleBottomSheetState extends State<SelectVehicleBottomSheet> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: context.color.bg2,
          title: Text('transport'.tr()),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: context.colorScheme.onSurface,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: Padding(
          padding: AppUtils.kPaddingHor20Ver30,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => ListView.separated(
              itemCount: state.trailerTypes.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(
                        SelectTrailerTypeEvent(type: state.trailerTypes[index]),
                      );
                },
                child: Row(
                  children: [
                    SelectWidget(
                        isSelected:
                            state.selectedTrailers.any((t) => t.guid == (state.trailerTypes[index].guid ?? ''))),
                    AppUtils.kGap8,
                    Expanded(
                      child: Text(
                        state.trailerTypes[index].fullName ?? '',
                        style: context.textStyle.size14Weight500Black,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (__, _) => AppUtils.kGap40,
            ),
          ),
        ),
      );
}
