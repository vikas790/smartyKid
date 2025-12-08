import '../../../core/base/base_cubit.dart';
import '../../../core/base/api_render_state.dart';
import 'english_state.dart';

class EnglishCubit extends BaseCubit<ApiRenderState> {
  EnglishCubit() : super(Ideal());

  Future<void> playLetterSound(String letter) async {
    emit(EnglishSoundPlaying(letter));
    // Audio playback logic would go here
    // await player.play(AssetSource('sounds/$letter.mp3'));
  }
}
