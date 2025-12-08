import 'package:flutter/material.dart';

extension WidgetPaddingExtension on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget withAllPadding(double padding) {
    return withPadding(EdgeInsets.all(padding));
  }

  Widget withSymmetricPadding({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return withPadding(EdgeInsets.symmetric(
      vertical: vertical,
      horizontal: horizontal,
    ));
  }

  Widget withOnlyPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return withPadding(EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ));
  }
}