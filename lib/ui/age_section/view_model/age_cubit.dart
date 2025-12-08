import 'package:flutter/material.dart';
import '../../core/base/base_cubit.dart';
import '../../core/base/api_render_state.dart';
import '../../../routing/navigation_services.dart';
import 'age_state.dart';

class AgeCubit extends BaseCubit<ApiRenderState> {
  AgeCubit() : super(Ideal());

  void selectAge(BuildContext context, int age) {
    emit(AgeSelectedState(age));
    // Navigate to Subject Screen
    navigation.push(Routes.subjectScreen, extra: age);
  }
}
