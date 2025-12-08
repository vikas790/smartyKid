import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';

enum ImageType { svg, png, network, file, unknown, svgNetWork }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetWork;
    } else if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://') || startsWith('/')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

class CustomImageView extends StatelessWidget {
  CustomImageView({
    super.key,
    this.icon,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeholderWidget,
    this.placeholderInitial,
    this.placeholderInitialColor,
    this.placeholderInitialTextStyle,
    this.placeHolder = 'https://skorekard.webdevprojects.cloud/assets/images/logo-small-320.svg',
  });

  ///[imagePath] is required parameter for showing image
  final String? imagePath;

  final double? height;

  final double? width;

  final Color? color;

  final BoxFit? fit;

  final String placeHolder;

  final Alignment? alignment;

  final VoidCallback? onTap;

  final EdgeInsetsGeometry? margin;

  final BorderRadius? radius;

  final BoxBorder? border;

  final Widget? placeholderWidget;

  final String? placeholderInitial;

  final Color? placeholderInitialColor;

  final TextStyle? placeholderInitialTextStyle;

  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return alignment != null ? Align(alignment: alignment!, child: _buildWidget()) : _buildWidget();
  }

  Widget _buildWidget() {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(onTap: onTap, child: _buildCircleImage()),
      ),
    );
  }

  ///build the image with border radius
  Widget _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(borderRadius: radius ?? BorderRadius.zero, child: _buildImageWithBorder());
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (icon != null) {
      return SizedBox(height: height, width: width, child: icon);
    } else if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svgNetWork:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.network(
              imagePath!,
              // "https://la10.webdevprojects.cloud/Guide_in_Dubai/storage/category/icon/Activity.svg",
              // 'https://upload.wikimedia.org/wikipedia/commons/c/c8/Butterfly-clipart.svg',
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null ? ColorFilter.mode(color ?? Colors.transparent, BlendMode.srcIn) : null,
            ),
          );
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null ? ColorFilter.mode(color ?? Colors.transparent, BlendMode.srcIn) : null,
            ),
          );
        case ImageType.file:
          return Image.file(File(imagePath!), height: height, width: width, fit: fit ?? BoxFit.cover, color: color);
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            // cacheManager: AuthCacheManager.withToken(GetIt.I<StorageService>().authToken),
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            color: color,
            placeholder: (context, url) {
              return placeholderWidget ??
                  (placeholderInitial != null
                      ? UserProfilePlaceHolder(
                    placeholderInitial: placeholderInitial!,
                    height: height,
                    width: width,
                    placeholderInitialColor: placeholderInitialColor,
                    textStyle: placeholderInitialTextStyle,
                  )
                      : SizedBox(
                    height: 30,
                    width: 30,
                    child: LinearProgressIndicator(color: Colors.grey.shade200, backgroundColor: Colors.grey.shade100),
                  ));
            },
            errorWidget: (context, url, error) => _buildPlaceholderWidget(),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return (placeholderInitial != null
                  ? UserProfilePlaceHolder(
                placeholderInitial: placeholderInitial!,
                height: height,
                width: width,
                placeholderInitialColor: placeholderInitialColor,
                textStyle: placeholderInitialTextStyle,
              )
                  : _buildPlaceholderWidget());
            },
          );
      }
    }
    return const SizedBox();
  }

  Widget _buildPlaceholderWidget() {
    switch (placeHolder.imageType) {
      case ImageType.svgNetWork:
        return SizedBox(
          height: height,
          width: width,
          child: SvgPicture.network(
            placeHolder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
          ),
        );
      case ImageType.network:
        return CachedNetworkImage(
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          imageUrl: placeHolder,
        );
      case ImageType.svg:
        return SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
          ),
        );
      case ImageType.png:
      default:
        return Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        );
    }
  }
}

class UserProfilePlaceHolder extends StatelessWidget {
  final double? height;
  final double? width;
  final String placeholderInitial;
  final Color? placeholderInitialColor;
  final TextStyle? textStyle;

  const UserProfilePlaceHolder({required this.placeholderInitial, super.key, this.height, this.width, this.placeholderInitialColor, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: placeholderInitialColor ?? AppColorsData.whiteFFFFFF.value),
      height: height ?? 30,
      width: width ?? 30,
      child: Center(
        // child: CustomText(
        //   placeholderInitial.toUpperCase(),
        //   style: textStyle ?? TextStyle(fontSize: height == null ? 14 : (height! / 2.5), color: AppColorsData.whiteFFFFFF.value),
        // ),
      ),
    );
  }
}