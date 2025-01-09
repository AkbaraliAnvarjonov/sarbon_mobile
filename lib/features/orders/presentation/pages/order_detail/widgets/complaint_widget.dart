import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/icons_constants.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../bloc/order_detail/order_details_bloc.dart';

class ComplaintWidget extends StatefulWidget {
  const ComplaintWidget({
    super.key,
    required this.state,
  });

  final OrderDetailsState state;

  @override
  State<ComplaintWidget> createState() => _ComplaintWidgetState();
}

class _ComplaintWidgetState extends State<ComplaintWidget> {
  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.colorScheme.onPrimary,
        body: BlocConsumer<OrderDetailsBloc, OrderDetailsState>(
          listenWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
          listener: (context, state) {
            if (state.orderDetailStatus.isSuccess) {
              context.pop(true);
            }
          },
          builder: (context, state) => CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            slivers: [
              SliverSafeArea(
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverList.list(
                      children: [
                        Container(
                          color: const Color(0xFFF6F7F8),
                          height: 70,
                          padding: AppUtils.kPaddingHor24Ver20,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SvgImage.warningRed,
                                height: 24,
                                width: 24,
                              ),
                              AppUtils.kGap10,
                              Text(
                                'file_a_complaint'.tr(),
                                style: context.textStyle.appBarTitle,
                              ),
                              AppUtils.kSpacer,
                              GestureDetector(
                                onTap: () => context.pop(),
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0xFF49454F),
                                ),
                              )
                            ],
                          ),
                        ),
                        AppUtils.kGap16,
                        TextFormField(
                          controller: commentController,
                          maxLines: 15,
                          style: context.textStyle.size14Weight400Black
                              .copyWith(fontSize: 18, color: const Color(0xFF211F26)),
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: 'Расскажите о возникшей проблеме...',
                            hintStyle: context.textStyle.size14Weight400Black.copyWith(
                              fontSize: 15,
                              color: const Color(0xFF7E7B86),
                            ),
                          ),
                          onChanged: (text) {
                            context.read<OrderDetailsBloc>().add(ChangeComplaintEvent(complaintComment: text));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.onPrimary,
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 0),
                blurRadius: 14,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ],
          ),
          child: SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
              buildWhen: (previous, current) => previous.orderDetailStatus != current.orderDetailStatus,
              builder: (context, state) => ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Готово'),
              ),
            ),
          ),
        ),
      );
}
