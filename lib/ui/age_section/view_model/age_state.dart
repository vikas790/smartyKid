import '../../core/base/api_render_state.dart';

class AgeState extends ApiRenderState {}

class AgeSelectedState extends AgeState {
  final int age;
  AgeSelectedState(this.age);
}
