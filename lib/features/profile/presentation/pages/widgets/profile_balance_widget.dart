import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/icons_constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../bloc/profile_bloc.dart';

class ProfileBalanceWidget extends StatelessWidget {
  const ProfileBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => ListTile(
          contentPadding: AppUtils.kPaddingHor12Ver4,
          shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius12,
          ),
          leading: Padding(
            padding: AppUtils.kPaddingAll4,
            child: SvgPicture.asset(
              SvgImage.icBalance,
            ),
          ),
          title: Text(
            'balance'.tr(),
            style: context.textStyle.size15Weight600Black.copyWith(
              color: context.color.darkGrey1,
            ),
          ),
          subtitle: Text(
            '0',
            style: context.textStyle.size13Weight500Black.copyWith(
              color: context.color.midGray2,
            ),
          ),
          trailing: InkWell(
            onTap: () {},
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.color.primary200,
              ),
              child: Padding(
                padding: AppUtils.kPaddingHor12Ver4,
                child: Text(
                  'fill_balance'.tr(),
                  style: context.textStyle.size15Weight500Black.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
