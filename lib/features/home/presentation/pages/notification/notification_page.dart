import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/loading/modal_progress_hud.dart';
import '../../../../../router/app_routes.dart';
import '../../../../orders/presentation/pages/orders_empty_page.dart';
import '../../bloc/notification/notification_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('notifications'.tr()),
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          buildWhen: (previous, current) => previous.fetchNotificationStatus != current.fetchNotificationStatus,
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.fetchNotificationStatus.isLoading,
            child: state.notificationList.isNotEmpty
                ? ListView.separated(
                    padding: AppUtils.kPaddingVertical16,
                    itemBuilder: (_, index) => Theme(
                      data: ThemeData(
                        listTileTheme: ListTileThemeData(
                          horizontalTitleGap: 8,
                          tileColor: context.colorScheme.surface,
                        ),
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          state.notificationList[index].isRead
                              ? SvgImage.inActiveNotification
                              : SvgImage.notificationChat,
                        ),
                        title: HtmlWidget(
                          state.notificationList[index].title,
                          textStyle: context.textStyle.size15Weight500Black,
                        ),
                        trailing: Column(
                          children: [
                            AppUtils.kGap4,
                            Text(
                              state.notificationList[index].date.timeParseHourMinute(),
                              style: context.textStyle.regularBody.copyWith(
                                color: context.color.greyText,
                              ),
                            ),
                            AppUtils.kSpacer,
                            Text(
                              state.notificationList[index].type,
                              style: context.textStyle.regularCaption1.copyWith(
                                color: context.color.greyText,
                              ),
                            ),
                            AppUtils.kGap4,
                          ],
                        ),
                        onTap: () async {
                          await context
                              .pushNamed(
                            Routes.notificationDetails,
                            extra: state.notificationList[index],
                          )
                              .then((value) {
                            if (!context.mounted) return;
                            context.read<NotificationBloc>().add(
                                  const FetchNotificationEvent(),
                                );
                          });
                        },
                      ),
                    ),
                    separatorBuilder: (_, index) => AppUtils.kDivider,
                    itemCount: state.notificationList.length,
                  )
                : const OrdersEmptyPage(),
          ),
        ),
      );
}
