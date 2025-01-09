import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/gifs_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../router/app_routes.dart';
import '../../bloc/profile_bloc.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.fullName,
    required this.phoneNumber,
    required this.imageUrl,
  });

  final String fullName;
  final String phoneNumber;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          listTileTheme: ListTileThemeData(
            horizontalTitleGap: 12,
            tileColor: context.colorScheme.surface,
          ),
        ),
        child: ListTile(
          onTap: () async {
            await context.pushNamed(Routes.editProfile).then(
              (value) {
                if (value != null && value == true) {
                  if(!context.mounted) return;
                  context.read<ProfileBloc>().add(const GetUserInfoEvent());
                }
              },
            );
          },
          contentPadding: AppUtils.kPaddingAll12,
          shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius12,
          ),
          minLeadingWidth: 56,
          minVerticalPadding: 0,
          leading: ClipOval(
            child: imageUrl.isEmpty || imageUrl == 'photo'
                ? const Image(
                    width: 56,
                    image: AssetImage(
                      GifsConstants.imagesIcUser,
                    ),
                  )
                : CachedNetworkImage(
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const CircularProgressIndicator.adaptive(),
                  ),
          ),
          title: Text(
            fullName,
            style: context.textStyle.regularHeadline,
          ),
          subtitle: Text(
            '${'phone_number'.tr()}: $phoneNumber',
            style: context.textStyle.regularSubheadline.copyWith(
              color: context.color.darkGrey5,
              fontSize: 12,
            ),
          ),
        ),
      );
}
