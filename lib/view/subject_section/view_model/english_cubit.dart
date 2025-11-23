import 'package:audioplayers/audioplayers.dart';
import 'package:smartykids/core/base/base_cubit.dart';

import 'english_state.dart';

class EnglishCubit extends BaseCubit {
  final AudioPlayer player = AudioPlayer();

  EnglishCubit();

  Future<void> playLetterSound(String letter) async {
    emit(EnglishSoundPlaying(letter));
    await player.play(AssetSource('sounds/$letter.mp3'));
    // Optionally reset state or keep it playing
  }

  @override
  Future<void> close() {
    player.dispose();
    return super.close();
  }
}
