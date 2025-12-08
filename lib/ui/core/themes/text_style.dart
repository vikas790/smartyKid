import 'package:flutter/material.dart';
import 'package:smartykids/utils/custom_screen_util.dart';

import 'app_font.dart';

mixin class TextStyles {
  /// Inter Tight Fonts
  final TextStyle interTightExtraBold900 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w900);
  final TextStyle interTightBold700 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w700);
  final TextStyle interTightSemiBold600 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w600);
  final TextStyle interTightMedium500 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w500);
  final TextStyle interTightRegular400 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w400);
  final TextStyle interTightLight300 = TextStyle(fontFamily: AppFontData.inter_tight.fontFamily, fontWeight: FontWeight.w300);

  /// Poppins Fonts
  final TextStyle poppinsExtraBold900 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w900);
  final TextStyle poppinsTightBold700 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w700);
  final TextStyle poppinsTightSemiBold600 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w600);
  final TextStyle poppinsTightMedium500 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w500);
  final TextStyle poppinsTightRegular400 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w400);
  final TextStyle poppinsTightLight300 = TextStyle(fontFamily: AppFontData.poppins.fontFamily, fontWeight: FontWeight.w300);

  /// Sacramento Fonts
  final TextStyle sacramentoRegular400 = TextStyle(fontFamily: AppFontData.sacramento.fontFamily, fontWeight: FontWeight.w400);

  /// Jost Fonts
  final TextStyle jostBold700 = TextStyle(fontFamily: AppFontData.jost.fontFamily, fontWeight: FontWeight.w700);
  final TextStyle jostSemiBold600 = TextStyle(fontFamily: AppFontData.jost.fontFamily, fontWeight: FontWeight.w600);
  final TextStyle jostRegular400 = TextStyle(fontFamily: AppFontData.jost.fontFamily, fontWeight: FontWeight.w400);

  TextStyle setFont(TextStyle textStyle, {Color color = Colors.white, double? fontSize, double? lineHeight, bool isUnderLine = false}) {
    return textStyle.copyWith(
      color: color,
      fontSize: fontSize?.sp,
      height: lineHeight,
      decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none,
    );
  }
}