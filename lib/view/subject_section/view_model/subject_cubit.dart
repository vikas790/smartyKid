import 'package:flutter/material.dart';
import '../../../core/base/base_cubit.dart';
import '../../../routes/routes.dart';
import 'subject_state.dart';

class SubjectCubit extends BaseCubit {
  SubjectCubit();

  void navigateToSubject(BuildContext context, String subjectName) {
    if (subjectName == 'English') {
      navigation.push(Routes.englishScreen);
    } else if (subjectName == 'Math') {
      navigation.push(Routes.mathScreen);
    } else if (subjectName == 'Science') {
      navigation.push(Routes.scienceScreen);
    }
  }
}
