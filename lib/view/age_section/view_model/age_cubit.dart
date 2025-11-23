import 'package:flutter/material.dart';
import '../../../core/base/base_cubit.dart';
import '../../../routes/routes.dart';
import 'age_state.dart';

class AgeCubit extends BaseCubit {
  AgeCubit();

  void selectAge(BuildContext context, int age) {
    emit(AgeSelectedState(age));
    // Navigate to Subject Screen
    navigation.push(Routes.subjectScreen, extra: age);
  }
}
