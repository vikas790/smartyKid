import 'package:flutter/material.dart';

class ResponsiveSizing {
  static const double baseWidth = 375.0;
  static const double baseHeight = 812.0;
  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _widthScaleFactor;
  static double? _heightScaleFactor;
  static double? _scaleFactor;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
    _widthScaleFactor = _screenWidth! / baseWidth;
    _heightScaleFactor = _screenHeight! / baseHeight;
    _scaleFactor = _widthScaleFactor! < _heightScaleFactor! ? _widthScaleFactor : _heightScaleFactor;
  }

  static double scaleWidth(double width) {
    return width * _widthScaleFactor!;
  }

  static double scaleHeight(double height) {
    return height * _heightScaleFactor!;
  }

  static double scaleFontSize(double fontSize) {
    return fontSize * _scaleFactor!;
  }

  static double scaleRadius(double radius) {
    return radius * _scaleFactor!;
  }

  static double verticalSpace(double height) {
    return height.h; // Use the height scaling
  }

  static double horizontalSpace(double width) {
    return width.w; // Use the width scaling
  }
}

extension ResponsiveExtension on num {
  double get w => ResponsiveSizing.scaleWidth(toDouble());
  double get h => ResponsiveSizing.scaleHeight(toDouble());
  double get sp => ResponsiveSizing.scaleFontSize(toDouble());
  double get r => ResponsiveSizing.scaleRadius(toDouble());
  SizedBox get verticalSpace => SizedBox(height: ResponsiveSizing.verticalSpace(toDouble()));
  SizedBox get horizontalSpace => SizedBox(width: ResponsiveSizing.horizontalSpace(toDouble()));
}