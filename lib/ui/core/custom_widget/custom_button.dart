import 'package:flutter/material.dart';
import 'package:smartykids/ui/core/base/base_widget.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/utils/custom_screen_util.dart';
import 'package:smartykids/utils/padding_extension.dart';


class CustomButton extends STLBaseWidget {
  Widget? leadingWidget;
  Widget? trailingWidget;
  String title;
  Color? fontColor;
  Color? backgroundColor;
  bool isEnabled = true;
  bool isBorderRadius = true;
  VoidCallback onTap;

  CustomButton({
    super.key,
    this.leadingWidget,
    this.trailingWidget,
    required this.title,
    this.isEnabled = true,
    required this.onTap,
    this.backgroundColor,
    this.fontColor,
    this.isBorderRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isEnabled ? backgroundColor ?? AppColorsData.redEF8354.value : AppColorsData.grayACB1B9.value,
          borderRadius: isBorderRadius ? BorderRadius.circular(16.r) : BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingWidget != null) leadingWidget!.withOnlyPadding(right: 8.w),
            Text(
              title,
              style: setFont(
                poppinsTightMedium500,
                color: isEnabled ? fontColor ?? AppColorsData.whiteFFFFFF.value : AppColorsData.whiteFFFFFF.value,
                fontSize: 16,
              ),
            ),
            if (trailingWidget != null) trailingWidget!.withOnlyPadding(left: 8.w),
          ],
        ),
      ),
    );
  }
}