import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../../../constants/icons_constants.dart';
import '../../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../../core/isolate/file_upload.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../core/widgets/custom_cached_image/custom_cached_network_image.dart';
import '../../../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../../../core/widgets/textfield/masked_formatter/masked_text_input_formatter.dart';
import '../../../../../../../../../router/app_routes.dart';
import '../../../../../../../data/models/announcement/create_announcement/create_announcement_request.dart';
import '../../../../../../../domain/entities/announcement/addresses/addresses_entity.dart';
import '../../../../../../../domain/entities/announcement/get_active_inactive_announcement/get_active_inactive_announcement_entity.dart';
import '../../../../../../../domain/entities/announcement/type_car/type_cars_entity.dart';
import '../../../../../../../domain/entities/announcement/type_currency/type_currency_entity.dart';
import '../../../../../../bloc/update_active_announcement/update_active_announcement_bloc.dart';

part '../../../../mixins/update_active_announcement_mixin.dart';

part '../../widgets/update_active_announcement_widgets/select_items_type.dart';

part '../../widgets/update_active_announcement_widgets/select_address_view.dart';

part '../../widgets/update_active_announcement_widgets/select_car_type_view.dart';

part '../../widgets/update_active_announcement_widgets/input_car_name_view.dart';

part '../../widgets/update_active_announcement_widgets/photo_and_comment_view.dart';

part '../../widgets/update_active_announcement_widgets/price_and_contact_view.dart';

part '../../widgets/update_active_announcement_widgets/update_announcement_button_view.dart';

part '../../widgets/update_active_announcement_widgets/status_announcement.dart';

enum SingingCharacter { lafayette, jefferson }

class UpdateActiveAnnouncementPage extends StatefulWidget {
  const UpdateActiveAnnouncementPage({super.key, required this.announcement});

  final GetActiveInActiveAnnouncementListEntity announcement;

  @override
  State<UpdateActiveAnnouncementPage> createState() =>
      _UpdateActiveAnnouncementPageState();
}

class _UpdateActiveAnnouncementPageState
    extends State<UpdateActiveAnnouncementPage>
    with UpdateActiveAnnouncementMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('active_publication'.tr()),
          scrolledUnderElevation: 0,
        ),
        body: BlocListener<UpdateActiveAnnouncementBloc,
            UpdateActiveAnnouncementState>(
          listenWhen: (previous, current) =>
              previous.updateAnnouncementStatus !=
              current.updateAnnouncementStatus,
          listener: (context, state) {
            if (state.updateAnnouncementStatus.isSuccess) {
              context.pop(true);
            }
          },
          child: BlocBuilder<UpdateActiveAnnouncementBloc,
              UpdateActiveAnnouncementState>(
            buildWhen: (previous, current) =>
                previous.getCarTypesStatus != current.getCarTypesStatus ||
                previous.getAddressesStatus != current.getAddressesStatus ||
                previous.getCurrencyTypesStatus !=
                    current.getCurrencyTypesStatus ||
                previous.updateAnnouncementStatus !=
                    current.updateAnnouncementStatus,
            builder: (context, state) => ModalProgressHUD(
              inAsyncCall: state.getCarTypesStatus.isLoading ||
                  state.getAddressesStatus.isLoading ||
                  state.getCurrencyTypesStatus.isLoading ||
                  state.updateAnnouncementStatus.isLoading,
              child: Form(
                key: _formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: AppUtils.kPaddingAll16,
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            const _SelectAddressViewWidget(),
                            AppUtils.kGap16,
                            const _SelectCarTypeViewWidget(),
                            AppUtils.kGap16,
                            _InputCarNameViewWidget(
                              nameController: nameController,
                            ),
                            AppUtils.kGap16,
                            _PhotoAndCommentViewWidget(
                              descriptionController: descriptionController,
                              updateActiveAnnouncementBloc:
                                  _updateActiveAnnouncementBloc,
                              imageUrl: widget.announcement.imageUrl,
                            ),
                            AppUtils.kGap16,
                            _PriceAndContactViewWidget(
                              priceController: priceController,
                              phoneController: phoneController,
                            ),
                            AppUtils.kGap16,
                            const _AnnouncementStatus(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _UpdateActiveAnnouncementButtonViewWidget(
          formKey: _formKey,
          nameController: nameController,
          descriptionController: descriptionController,
          priceController: priceController,
          phoneController: phoneController,
          updateAnnouncementBloc: _updateActiveAnnouncementBloc,
          announcement: widget.announcement,
        ),
      );
}
