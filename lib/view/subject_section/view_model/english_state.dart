import 'package:smartykids/core/base/api_render_state.dart';

class EnglishState extends ApiRenderState {}

class EnglishInitial extends EnglishState {}

class EnglishSoundPlaying extends EnglishState {
  final String letter;
  EnglishSoundPlaying(this.letter);
}
