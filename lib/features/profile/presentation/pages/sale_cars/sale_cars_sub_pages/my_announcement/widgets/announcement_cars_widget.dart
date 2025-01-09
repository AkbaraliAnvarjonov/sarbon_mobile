import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/extension/extension.dart';
import '../../../../../../../../core/utils/utils.dart';

class AnnouncementCarWidget extends StatelessWidget {
  const AnnouncementCarWidget({
    super.key,
    required this.imageUrl,
    required this.carName,
    required this.carPrice,
    required this.currency,
    required this.carDescription,
    required this.onTap,
  });

  final String imageUrl;
  final String carName;
  final int carPrice;
  final String currency;
  final String carDescription;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Material(
          color: context.colorScheme.surface,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: AppUtils.kBorderRadius8,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 137,
                    height: 87,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: context.color.greyText,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                AppUtils.kGap16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      carName,
                      style: context.textStyle.size15Weight500Black.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppUtils.kGap4,
                    Text(
                      '${carPrice.moneyFormat} $currency',
                      style: context.textStyle.size13Weight600Black.copyWith(
                        fontSize: 11,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    AppUtils.kGap4,
                    SizedBox(
                      width: context.kSize.width * 0.5,
                      child: Text(
                        carDescription.length > 80
                            ? '${carDescription.substring(0, 80)}...'
                            : carDescription,
                        style: context.textStyle.regularCaption2.copyWith(
                          color: context.color.greyText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
