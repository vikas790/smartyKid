import 'package:flutter/material.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/base/api_render_state.dart';
import '../../../../routing/navigation_services.dart';
import 'splash_state.dart';

class SplashCubit extends BaseCubit<ApiRenderState> {
  SplashCubit() : super(Ideal());

  void initSplash() {
    Future.delayed(Duration(seconds: 3), () {
      navigation.go(Routes.ageScreen);
    });
  }
}
