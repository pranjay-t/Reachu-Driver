import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/utils/app_logger.dart';
import '../../app/theme/app_colors.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadiusGeometry? borderRadius;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  String get _fullUrl => ApiEndpoints.getFullImageUrl(imageUrl);

  @override
  Widget build(BuildContext context) {
    final fullUrl = _fullUrl;
    if (fullUrl.isEmpty) {
      return _buildErrorWidget(context);
    }

    AppLogger.d("🖼️ [AppCachedImage] Loading Image | Input: '$imageUrl' | Complete URL: '$fullUrl'");

    Widget image = CachedNetworkImage(
      imageUrl: fullUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            color: Theme.of(context).brightness == Brightness.dark 
                ? AppColors.darkSurface03 
                : AppColors.lightSurface03,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      errorWidget: (context, url, error) => _buildErrorWidget(context),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (errorWidget != null) {
      return errorWidget!;
    }
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).brightness == Brightness.dark 
          ? AppColors.darkSurface03 
          : AppColors.lightSurface03,
      child: const Center(
        child: Icon(Icons.broken_image_outlined, color: AppColors.neutral500),
      ),
    );
  }
}
