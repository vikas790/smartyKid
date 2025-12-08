import 'package:flutter/material.dart';
import 'package:smartykids/routing/navigation_services.dart';
import 'package:smartykids/ui/core/custom_widget/display_image_widget.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/ui/core/themes/app_images.dart';
import 'package:smartykids/utils/custom_screen_util.dart';
import 'package:smartykids/utils/padding_extension.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? preferredSizeValue;
  final Widget? leading;
  final Widget? trailing;
  final Widget? centerWidget;
  final bool isLogoVisible;
  final bool isDashboard;
  final VoidCallback? onLeadingTap;

  final Color? appBarColor;
  final bool? isBottomBorderVisible;
  final bool isApplyPadding;
  final bool isMenuClick;

  CustomAppBar({
    this.title,
    this.preferredSizeValue,
    this.leading,
    this.trailing,
    this.centerWidget,
    this.appBarColor,
    this.isApplyPadding = false,
    this.isLogoVisible = false,
    this.isDashboard = false,
    this.isMenuClick = false,
    this.isBottomBorderVisible = false,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: isMenuClick ? AppColorsData.whiteEAEBF1.value : AppColorsData.gray2D3142.value,
      automaticallyImplyLeading: false,
      // toolbarHeight: isLogoVisible ? 57.h : 72.h,
      backgroundColor: isMenuClick ? AppColorsData.whiteEAEBF1.value : AppColorsData.gray2D3142.value,
      centerTitle: true,
      leadingWidth: isLogoVisible ? 145.w : 60.w,
      actionsPadding: EdgeInsets.only(right: isApplyPadding ? 16.w : 0),
      leading: leading ??
          GestureDetector(
            onTap: onLeadingTap ??
                    () {
                  NavigationService().pop();
                },
            child: CustomImageView(
              imagePath: isLogoVisible
                  ? AppIconsPaths.icSkorekardLogo.path
                  : isDashboard
                  ? AppIconsPaths.icMenu.path
                  : AppIconsPaths.icBackArrow.path,
              height: isLogoVisible ? 48.w : 44.w,
              width: isLogoVisible ? 48.w : 44.w,
              // color: AppColorsData.whiteFFFFFF.value,
            ),
          ).withOnlyPadding(left: 16.w),
      actions: [
        trailing ?? SizedBox(height: 40.w, width: 40.w),
      ],
      title: centerWidget ?? SizedBox(height: 24.h, width: 115.w),
      /*title: Container(
        // height: 70.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appBarColor ?? Colors.transparent,
          border: isBottomBorderVisible!
              ? Border(
                  bottom: BorderSide(
                    color: AppColorsData.gray767D89.value.withValues(alpha: 0.12),
                    width: 1.0,
                  ),
                )
              : null,
        ),

        //
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // leading ??
            //     GestureDetector(
            //       onTap: () {
            //         NavigationService().pop(context);
            //       },
            //       child: CustomImageView(
            //         imagePath: AppIconsPaths.icBackArrow.path,
            //         height: 48.h,
            //         width: 48.w,
            //         // color: AppColorsData.whiteFFFFFF.value,
            //       ),
            //     ),

            Center(
              child: centerWidget ?? SizedBox(height: 24.h, width: 115.w),
            ),
            trailing ?? SizedBox(height: 40.h, width: 40.w),
            // trailing ??
            // PopupMenuButton(
            //   icon: CustomImageView(
            //     imagePath: AppIconsPaths.icMore.path,
            //     height: 40.h,
            //     width: 40.w,
            //   ),
            //   itemBuilder: (context) => popupMenuItems,
            // ),
          ],
        ),
      ),*/
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
// Size get preferredSize => Size.fromHeight(isLogoVisible ? 57.h : 72.h);
}