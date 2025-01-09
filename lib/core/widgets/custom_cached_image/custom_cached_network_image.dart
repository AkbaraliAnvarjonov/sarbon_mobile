import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../extension/extension.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit,
    this.cacheManager,
    this.borderRadiusTopLeft,
    this.borderRadiusTopRight,
    this.borderRadiusBottomLeft,
    this.borderRadiusBottomRight,
  });

  final BaseCacheManager? cacheManager;
  final String imageUrl;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadiusTopLeft;
  final double? borderRadiusTopRight;
  final double? borderRadiusBottomLeft;
  final double? borderRadiusBottomRight;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadiusTopLeft ?? 0),
          topRight: Radius.circular(borderRadiusTopRight ?? 0),
          bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0),
          bottomRight: Radius.circular(borderRadiusBottomRight ?? 0),
        ),
        child: CachedNetworkImage(
          cacheManager: cacheManager,
          imageUrl: imageUrl,
          width: width,
          height: height,
          memCacheWidth: width == null
              ? null
              : (width! * context.devicePixelRatio).toInt(),
          memCacheHeight: height == null
              ? null
              : (height! * context.devicePixelRatio).toInt(),
          fit: fit,
          placeholder: placeholder,
          errorWidget: errorWidget,
          progressIndicatorBuilder: progressIndicatorBuilder,
          imageBuilder: imageBuilder,
        ),
      );
}
