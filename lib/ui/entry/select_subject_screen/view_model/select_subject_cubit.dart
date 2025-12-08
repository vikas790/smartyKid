import 'package:flutter/material.dart';
import 'package:smartykids/routing/navigation_services.dart';
import 'package:smartykids/ui/core/base/base_cubit.dart';

import 'select_subject_state.dart';

class SelectSubjectCubit extends BaseCubit {
  SelectSubjectCubit() : super(SubjectInitial());

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
