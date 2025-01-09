import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../../../router/app_routes.dart';
import '../../../../../domain/entities/notification/notification_response_entity.dart';
import '../../../../bloc/notification/detail_notification/detail_notification_bloc.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({
    super.key,
    required this.notification,
  });

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('notifications'.tr()),
        ),
        body: BlocBuilder<DetailNotificationBloc, DetailNotificationState>(
          buildWhen: (previous, current) =>
              previous.putNotificationStatus != current.putNotificationStatus,
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.putNotificationStatus.isLoading,
            child: CustomScrollView(
              slivers: [
                SliverSafeArea(
                  sliver: SliverPadding(
                    padding: AppUtils.kPaddingAll16,
                    sliver: DecoratedSliver(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: AppUtils.kBorderRadius12,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Padding(
                          padding: AppUtils.kPaddingAll16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: AppUtils.kBorderRadius12,
                                child: CachedNetworkImage(
                                  imageUrl: notification.imageUrl,
                                  height: 200,
                                  width: context.kSize.width,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: context.color.greyText,
                                  ),
                                ),
                              ),
                              AppUtils.kGap16,
                              Text(
                                notification.title,
                                style: context.textStyle.appBarTitle,
                              ),
                              AppUtils.kGap8,
                              HtmlWidget(
                                notification.description,
                                textStyle:
                                    context.textStyle.regularCallout.copyWith(
                                  color: context.color.darkGrey5,
                                ),
                              ),
                              if (notification.responseId.isNotEmpty) ...[
                                AppUtils.kGap16,
                                ElevatedButton(
                                  onPressed: () async {
                                    await context
                                        .pushNamed(
                                      Routes.orderByNotification,
                                      extra: notification.responseId,
                                    )
                                        .then(
                                      (value) {
                                        if (value != null && value == true) {
                                          if (!context.mounted) return;
                                          context.pop();
                                        }
                                      },
                                    );
                                  },
                                  child: Text('go_to_order'.tr()),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
