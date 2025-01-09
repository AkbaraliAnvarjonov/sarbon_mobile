import 'dart:io';

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
import '../../../../../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../../../core/widgets/textfield/masked_formatter/masked_text_input_formatter.dart';
import '../../../../../../../../../router/app_routes.dart';
import '../../../../../../../data/models/announcement/create_announcement/create_announcement_request.dart';
import '../../../../../../../domain/entities/announcement/addresses/addresses_entity.dart';
import '../../../../../../../domain/entities/announcement/type_car/type_cars_entity.dart';
import '../../../../../../../domain/entities/announcement/type_currency/type_currency_entity.dart';
import '../../../../../../bloc/create_announcement/create_announcement_bloc.dart';

part '../../../../mixins/create_new_announcement_mixin.dart';

part '../../widgets/create_announcement_widgets/select_items_type.dart';

part '../../widgets/create_announcement_widgets/select_address_view.dart';

part '../../widgets/create_announcement_widgets/select_car_type_view.dart';

part '../../widgets/create_announcement_widgets/input_car_name_view.dart';

part '../../widgets/create_announcement_widgets/photo_and_comment_view.dart';

part '../../widgets/create_announcement_widgets/price_and_contact_view.dart';

part '../../widgets/create_announcement_widgets/create_announcement_button_view.dart';

class CreateNewAnnouncementPage extends StatefulWidget {
  const CreateNewAnnouncementPage({super.key});

  @override
  State<CreateNewAnnouncementPage> createState() =>
      _CreateNewAnnouncementPageState();
}

class _CreateNewAnnouncementPageState extends State<CreateNewAnnouncementPage>
    with CreateNewAnnouncementMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('create_publication'.tr()),
          scrolledUnderElevation: 0,
        ),
        body: BlocListener<CreateAnnouncementBloc, CreateAnnouncementState>(
          listenWhen: (previous, current) =>
              previous.createAnnouncementStatus !=
              current.createAnnouncementStatus,
          listener: (context, state) {
            if (state.createAnnouncementStatus.isSuccess) {
              context.pop(true);
            }
          },
          child: BlocBuilder<CreateAnnouncementBloc, CreateAnnouncementState>(
            buildWhen: (previous, current) =>
                previous.getCarTypesStatus != current.getCarTypesStatus ||
                previous.getAddressesStatus != current.getAddressesStatus ||
                previous.getCurrencyTypesStatus !=
                    current.getCurrencyTypesStatus ||
                previous.createAnnouncementStatus !=
                    current.createAnnouncementStatus,
            builder: (context, state) => ModalProgressHUD(
              inAsyncCall: state.getCarTypesStatus.isLoading ||
                  state.getAddressesStatus.isLoading ||
                  state.getCurrencyTypesStatus.isLoading ||
                  state.createAnnouncementStatus.isLoading,
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
                              createAnnouncementBloc: _createAnnouncementBloc,
                            ),
                            AppUtils.kGap16,
                            _PriceAndContactViewWidget(
                              priceController: priceController,
                              phoneController: phoneController,
                            ),
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
        bottomNavigationBar: _CreateAnnouncementButtonViewWidget(
          formKey: _formKey,
          nameController: nameController,
          descriptionController: descriptionController,
          priceController: priceController,
          phoneController: phoneController,
          createAnnouncementBloc: _createAnnouncementBloc,
        ),
      );
}
