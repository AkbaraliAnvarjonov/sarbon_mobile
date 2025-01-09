import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../../core/widgets/inputs/masked_text_input_formatter.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../../data/models/complain/create_complain_request.dart';
import '../../bloc/complain/complain_bloc.dart';

part '../mixins/complain_mixin.dart';

class ComplainPage extends StatefulWidget {
  const ComplainPage({super.key});

  @override
  State<ComplainPage> createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> with ComplainMixin {
  @override
  Widget build(BuildContext context) =>
      BlocListener<ComplainBloc, ComplainState>(
        listenWhen: (previous, current) =>
            previous.createComplainStatus != current.createComplainStatus,
        listener: (context, state) {
          if (state.createComplainStatus.isSuccess) {
            context.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('complain'.tr()),
          ),
          body: Form(
            key: _formKey,
            child: ModalProgressHUD(
              inAsyncCall: context.select(
                (ComplainBloc bloc) =>
                    bloc.state.createComplainStatus.isLoading,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          CustomTextField(
                            hintText: '',
                            labelText: 'f_i_o'.tr(),
                            controller: _nameController,
                            enabled: false,
                            fillColor: context.colorScheme.surface,
                            showBorder: false,
                          ),
                          AppUtils.kGap16,
                          CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty || value.length < 12) {
                                return 'Пожалуйста, введите правильно номер телефона';
                              }
                              return null;
                            },
                            hintText: 'Введите номер телефона',
                            labelText: 'phone_number'.tr(),
                            onChanged: (value) {},
                            controller: _phoneController,
                            textInputFormatter: MaskedTextInputFormatter(
                              mask: '00 000 00 00',
                              separator: ' ',
                              filter: RegExp('[0-9]'),
                            ),
                            textInputType: TextInputType.number,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    PngImage.icFlag,
                                    width: 28,
                                    height: 18,
                                  ),
                                  AppUtils.kGap8,
                                  Text(
                                    '+998',
                                    style: context.textStyle.regularCallout,
                                  ),
                                ],
                              ),
                            ),
                            prefixTextStyle:
                                context.textStyle.regularSubheadline,
                          ),
                          AppUtils.kGap16,
                          CustomTextField(
                            hintText: '',
                            labelText: 'your_complaint'.tr(),
                            controller: _messageController,
                            maxLines: 5,
                            fillColor: context.colorScheme.surface,
                            showBorder: false,
                            contentPadding: AppUtils.kPaddingAll12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ColoredBox(
            color: context.colorScheme.surface,
            child: SafeArea(
              minimum: AppUtils.kPaddingAll16,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ComplainBloc>().add(
                          CreateComplainEvent(
                            request: CreateComplainRequest(
                              data: Data(
                                usersId: localSource.userId,
                                phone: _phoneController.text,
                                text: _messageController.text,
                              ),
                            ),
                          ),
                        );
                  }
                },
                child: Text('send'.tr()),
              ),
            ),
          ),
        ),
      );
}
