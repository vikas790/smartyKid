import 'package:flutter/material.dart';

import 'package:smartykids/routing/navigation_services.dart';
import 'package:smartykids/ui/core/base/base_widget.dart';
import 'package:smartykids/ui/core/custom_widget/display_image_widget.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/ui/core/themes/app_images.dart';
import 'package:smartykids/utils/custom_screen_util.dart';
import 'package:smartykids/utils/padding_extension.dart';

class BottomSheetHeader extends STLBaseWidget {
  final String title;
  final bool showCancelButton;
  final bool isApplyPadding;

  BottomSheetHeader({
    super.key,
    required this.title,
    this.showCancelButton = false,
    this.isApplyPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isApplyPadding ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: setFont(
                poppinsTightSemiBold600,
                fontSize: 18,
                color: AppColorsData.black050506.value,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showCancelButton)
            GestureDetector(
              onTap: () {
                NavigationService().pop();
                debugPrint("Cross Button Tapped...!");
              },
              child: CustomImageView(
                height: 24.h,
                width: 24.w,
                imagePath: AppIconsPaths.icCross.path,
              ).withAllPadding(8),
            ),
        ],
      ),
    );
  }
}