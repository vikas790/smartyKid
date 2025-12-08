import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_widget.dart';
import '../../../core/base/api_render_state.dart';
import '../view_model/english_cubit.dart';
import '../view_model/english_state.dart';

class EnglishScreen extends BaseWidget {
  EnglishScreen({Key? key}) : super(key: key);

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  final EnglishCubit _englishCubit = EnglishCubit();
  final letters = List.generate(26, (i) => String.fromCharCode(65 + i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title: Text('Learn A–Z'), backgroundColor: Colors.purple),
      body: BlocProvider(
        create: (context) => _englishCubit,
        child: BlocBuilder(
          bloc: _englishCubit,
          builder: (context, state) {
            String? playingLetter;
            if (state is EnglishSoundPlaying) {
              playingLetter = state.letter;
            }

            return GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: letters.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final letter = letters[index];
                final isPlaying = letter == playingLetter;

                return GestureDetector(
                  onTap: () => _englishCubit.playLetterSound(letter),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isPlaying ? Colors.orangeAccent : Colors.amberAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isPlaying ? Colors.orange.withOpacity(0.6) : Colors.grey.shade300,
                          blurRadius: isPlaying ? 12 : 6,
                          spreadRadius: isPlaying ? 2 : 0,
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      letter,
                      style: widget.setFont(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 32,
                        color: isPlaying ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
