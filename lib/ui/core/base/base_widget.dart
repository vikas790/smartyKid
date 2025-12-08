import 'package:smartykids/data/di/common_di.dart';

import '../themes/text_style.dart';
import 'package:flutter/material.dart';

abstract class BaseWidget extends StatefulWidget with CommonDi, TextStyles {
  BaseWidget({super.key});
}

abstract class STLBaseWidget extends StatelessWidget with CommonDi, TextStyles {
  STLBaseWidget({super.key});
}