import 'package:flutter/material.dart';
import '../di/common_di.dart';
import '../themes/text_style.dart';

abstract class BaseWidget extends StatefulWidget with CommonDi, TextStyles {
  BaseWidget({super.key});

  @override
  TextStyle setFont(TextStyle style, {double? fontSize, Color? color, bool isUnderLine = false}) {
    return style.copyWith(
      fontSize: fontSize,
      color: color,
      decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none,
    );
  }
}

abstract class STLBaseWidget extends StatelessWidget with CommonDi, TextStyles {
  STLBaseWidget({super.key});
  
  TextStyle setFont(TextStyle style, {double? fontSize, Color? color, bool isUnderLine = false}) {
    return style.copyWith(
      fontSize: fontSize,
      color: color,
      decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none,
    );
  }
}
