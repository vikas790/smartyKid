import 'package:flutter/material.dart';
import 'package:smartykids/ui/core/custom_widget/display_image_widget.dart';
import 'package:smartykids/ui/core/themes/app_color.dart';
import 'package:smartykids/ui/core/themes/app_images.dart';
import 'package:smartykids/ui/core/themes/text_style.dart';
import 'package:smartykids/utils/custom_screen_util.dart';

class ToastService with TextStyles {
  void errorToast(BuildContext context, String message) {
    _snackBarView(
      context,
      // title: 'Failure!',
      message: message,
      color: AppColorsData.redEC2328.value,
      imagePath: AppIconsPaths.icFailure.path,
    );
  }

  void successToast(BuildContext context, String message) {
    _snackBarView(
      context,
      // title: 'Success!',
      message: message,
      color: AppColorsData.green4D8B31.value,
      imagePath: AppIconsPaths.icSuccess.path,
    );
  }

  void _snackBarView(
      BuildContext context, {
        // required String title,
        required String message,
        required Color color,
        required String imagePath,
      }) {
    if (message.isEmpty) return;
    // final messenger = ScaffoldMessenger.maybeOf(context);
    ScaffoldMessenger.of(context).clearSnackBars();

    // if (messenger == null) return;

    final screenWidth = MediaQuery.of(context).size.width;
    // messenger.hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
    // messenger.clearSnackBars();

    // final heroTag =
    //     'toast-${DateTime.now().microsecondsSinceEpoch}-${message.hashCode}';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // heroTag: heroTag,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
        duration: Duration(seconds: 3),
        content: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColorsData.black050506.value,
              //     offset: Offset(5, 5),
              //   ),
              // ],
              border: Border(
                left: BorderSide(
                  color: color,
                  width: 5,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 34.w,
                  width: 34.w,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: CustomImageView(
                    height: 20.h,
                    width: 20.h,
                    imagePath: imagePath,
                  ),
                ),
                8.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text(
                      //   title,
                      //   style: setFont(
                      //     poppinsTightMedium500,
                      //     fontSize: 14,
                      //     color: AppColorsData.gray464B53.value,
                      //   ),
                      // ),
                      Text(
                        message,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: setFont(
                          poppinsTightRegular400,
                          fontSize: 12,
                          color: AppColorsData.gray767D89.value,
                        ),
                      ),
                    ],
                  ),
                ),
                8.w.horizontalSpace,
                CustomImageView(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  },
                  imagePath: AppIconsPaths.icCross.path,
                  width: 20.w,
                  height: 20.h,
                  color: AppColorsData.gray767D89.value,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}